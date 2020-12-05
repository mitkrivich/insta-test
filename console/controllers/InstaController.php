<?php
/**
 * Консоль инстаграмм
 */

namespace console\controllers;

use common\models\Carusel;
use common\models\InstagramTable;
use common\models\Posts;
use common\models\Setting;
use console\models\ConsoleLog;
use InstagramScraper\Instagram;
use Phpfastcache\Helper\Psr16Adapter;
use Yii;
use yii\console\Controller;
use yii\helpers\Console;
use yii\mutex\FileMutex;
use yii\mutex\Mutex;

/**
 * Console controller
 */
class InstaController extends Controller
{
    private $output;
    private $isError=false;

    /**
     * Переопределение вывода
     */
    public function stdout($string)
    {
        parent::stdout($string);
        $this->output = $this->output.$string;
    }
   /**
     * Запись лога операций
     * @return boolean
     */
    public function afterAction($action, $result)
    {
        $result = parent::afterAction($action, $result);
        $log=new ConsoleLog();
        $log->textLog=$this->output;
        $log->isError=$this->isError;
        $log->save(false);
        return $result;
    }
    /**
     * Загрузка информации из инстаграмм
     * @return boolean
     */
    public function actionIndex() {
        try {
            //записываем файл метку об начала cron операции
            $setting=Setting::find()->one();
            $isError=false;
            $cronFile=Yii::getAlias('@app/cronInsta.txt');
            $mutexName='insta';
            $mutex = new FileMutex();
            if (!$mutex->acquire($mutexName)) {
                // business logic execution
                $this->stdout('cron service alredy runnning! exit cron', Console::FG_RED, Console::BLINK);
                $this->stdout(PHP_EOL);
                return false;
            }
            file_put_contents($cronFile,time());
            $this->stdout('cron service runnning!', Console::FG_GREY, Console::BLINK);
            $this->stdout(PHP_EOL);

            $nicks = InstagramTable::find()->all();
            $this->stdout('InstagramTable::find()->all();');
            $this->stdout(PHP_EOL);
            $this->stdout('User='.Yii::$app->params['instaLogin'].PHP_EOL);
      //      $this->stdout('Proxy='.Yii::$app->params['instaConsoleProxy'].PHP_EOL);
            $instagram =null;
            if ($setting->proxy=='') {
                $this->stdout('Instagram без прокси');
                $instagram = Instagram::withCredentials(new \GuzzleHttp\Client(), Yii::$app->params['instaLogin'], Yii::$app->params['instaPass'], new Psr16Adapter('files'));
            }
            else {
                $this->stdout('Instagram c прокси');
                $instagram = Instagram::withCredentials(new \GuzzleHttp\Client(['proxy' => $setting->proxy]), Yii::$app->params['instaLogin'], Yii::$app->params['instaPass'], new Psr16Adapter('files'));
            }
            $this->stdout('Instagram::withCredentials');
            $this->stdout(PHP_EOL);
            $instagram->setUserAgent('Mozilla/6.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.38');
            $this->stdout('setUserAgent');
            $this->stdout(PHP_EOL);
//            $instagram->setCustomCookies($newCookie); //можно записать куки чтобы не авторизоваться каждый раз, отложили для будущей доработки
           $instagram->login();
           $this->stdout('login');
           $this->stdout(PHP_EOL);
           $instagram->saveSession();
           $this->stdout('saveSession');
           $this->stdout(PHP_EOL);
        }
        catch (\Exception $ex) {
            //Выводим сообщение об исключении.
            if (file_exists($cronFile))
                unlink($cronFile);
            $this->stdout('!!!Error '.$ex->getMessage(), Console::FG_RED, Console::BLINK);
            $this->stdout(PHP_EOL);
            $this->isError=true;
            $mutex->release($mutexName);
            return false;
        }

        //цикл по пользователям
        foreach ($nicks as $nick) {
            try {
                sleep (1); //делаем паузу чтобы не приняли за робота. Но не помогает :)
                $account = $instagram->getAccountById($nick->instagramId);
                $media = $account->getMedias();
                $postCount = 0;
                $nick->instagramId = $account->getId();
                $nick->fullName = $account->getFullName();
                $nick->biography = $account->getBiography();
                $nick->avatarUrl = $account->getProfilePicUrlHd();
                $nick->followsCount = $account->getFollowsCount();
                $nick->followedByCount = $account->getFollowedByCount();
                $nick->mediaCount = $account->getMediaCount();
                $nick->save(false);
                //      VarDumper::dump($account,10,true);
                foreach ($media as $row) {
                    $postCount++;
                    $postId = $row->getId();

//                проверка на существование поста в локальном БД
                    $post = Posts::find()->where(['instagramId' => $postId])->one();

                    //VarDumper::dump($post,10,true);
                    if (!$post) {
                        $this->stdout($nick->name.' ('.$nick->fullName. ') new post', Console::FG_GREY);
                        $this->stdout(PHP_EOL);
                        $post = new Posts();
                    }
                    $post->instagramId = $postId;
                    $post->nickId = $nick->id;
                    $post->createdTime = $row->getCreatedTime();
                    $post->type = $row->getType();
                    $post->imageUrl = $row->getImageHighResolutionUrl();
                    $post->videoUrl = $row->getVideoStandardResolutionUrl();
                    $post->linkUrl = $row->getLink();
                    $post->locationName = $row->getLocationName();
                    $post->caption = $row->getCaption();
                    $post->likesCount = $row->getLikesCount();
                    $post->commentsCount = $row->getCommentsCount();
                    $post->save(false);
                    if ($row->getType() == 'sidecar') {
                        foreach ($row->getSidecarMedias() as $carusel) {
                            $caruselTable = $post->findCarusel($carusel->getId());
                            if (!$caruselTable) {
                                $caruselTable = new Carusel();
                                $caruselTable->caruselId = $post->postId;
                                $caruselTable->instagramId = $carusel->getId();
                                $caruselTable->nickId = $nick->id;
                                $caruselTable->createdTime = $carusel->getCreatedTime();
                                $caruselTable->type = $carusel->getType();
                                $caruselTable->imageUrl = $carusel->getImageHighResolutionUrl();
                                $caruselTable->videoUrl = $carusel->getVideoStandardResolutionUrl();
                                $caruselTable->save(false);

                            }
                        }
                    }


                    //  break;
                    if ($postCount >= 10) break;
                } // foreach ($media as $row)
            }
            catch (\Exception $ex) {
                   //Ошибка в получении данных по пользователю
                    $ex->getMessage();
                   $this->stdout('!!!Error '.$nick->name.', '.$ex->getMessage(), Console::FG_RED, Console::BLINK);
                   $this->stdout(PHP_EOL);
                   $this->isError=true;
                  $mutex->release($mutexName);
                //    return false;
                }

            }

              $setting = Setting::find()->one();
              $setting->genDate = new \yii\db\Expression('NOW()');
              $setting->save(false);
               if(!$isError) {
                  $this->stdout('Done!', Console::FG_GREEN, Console::BOLD);
               }
               else {
                  $this->isError=true;
                  $this->stdout('Done with error!', Console::FG_RED, Console::BOLD);
               }
            $this->stdout(PHP_EOL);
            $mutex->release($mutexName);
        return true;
    }

}