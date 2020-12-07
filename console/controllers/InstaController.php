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
    public function actionIndex()
    {
        try {
             $setting = Setting::find()->one();
             $isError = false;
            //mutex
             $mutexName = 'insta';
             $mutex = new FileMutex();
             if (!$mutex->acquire($mutexName)) {
                // business logic execution
                $this->stdout('cron service alredy runnning! exit cron', Console::FG_RED, Console::BLINK);
                $this->stdout(PHP_EOL);
                return false;
             }
            //коннект к Instagram
            $this->stdout('cron service runnning!', Console::FG_GREY, Console::BLINK);
            $this->stdout(PHP_EOL);
            $this->stdout('InstagramTable::find()->all();');
            $this->stdout(PHP_EOL);
            $this->stdout('User=' . Yii::$app->params['instaLogin'] . PHP_EOL);
            $instagram = null;
            if ($setting->proxy == '') {
                $this->stdout('Instagram без прокси');
                $instagram = Instagram::withCredentials(new \GuzzleHttp\Client(), Yii::$app->params['instaLogin'], Yii::$app->params['instaPass'], new Psr16Adapter('files'));
            } else {
                $this->stdout('Instagram c прокси');
                $instagram = Instagram::withCredentials(new \GuzzleHttp\Client(['proxy' => $setting->proxy]), Yii::$app->params['instaLogin'], Yii::$app->params['instaPass'], new Psr16Adapter('files'));
            }
            $this->stdout('Instagram::withCredentials');
            $this->stdout(PHP_EOL);
            $instagram->setUserAgent('Mozilla/6.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.38');
            $this->stdout('setUserAgent');
            $this->stdout(PHP_EOL);
//            $instagram->setCustomCookies($newCookie); //можно записать куки чтобы не авторизоваться каждый раз, отложили для будущей доработки
            //вход в Инстаграм
            $instagram->login();
            $this->stdout('login');
            $this->stdout(PHP_EOL);
            $instagram->saveSession();
            $this->stdout('saveSession');
            $this->stdout(PHP_EOL);
        } catch (\Exception $ex) {
            //Выводим сообщение об исключении.
            $this->stdout('!!!Error ' . $ex->getMessage(), Console::FG_RED, Console::BLINK);
            $this->stdout(PHP_EOL);
            $this->isError = true;
            $mutex->release($mutexName);
            return false;
        }
        //цикл по пользователям
        $nicks = InstagramTable::find()->all();
        foreach ($nicks as $nick) {
            try {
                //старт транзакции
                $transaction = Yii::$app->db->beginTransaction();

                //загрзука информации из Instagram
                $nick->loadInfo($instagram, $this);
                $setting = Setting::find()->one();
                $setting->genDate = new \yii\db\Expression('NOW()');
                $setting->save(false);
                if (!$isError) {
                    $this->stdout('Done!', Console::FG_GREEN, Console::BOLD);
                } else {
                    $this->isError = true;
                    $this->stdout('Done with error!', Console::FG_RED, Console::BOLD);
                }
                $this->stdout(PHP_EOL);

                //подтверждение транзакции
                $transaction->commit();

                //снятие блокировки запуска
                $mutex->release($mutexName);
            } catch (\Exception $ex) {
                //Ошибка в получении данных по пользователю
                $ex->getMessage();
                $this->stdout('!!!Error ' . $nick->name . ', ' . $ex->getMessage(), Console::FG_RED, Console::BLINK);
                $this->stdout(PHP_EOL);
                $this->isError = true;
                $transaction->rollBack();
                $mutex->release($mutexName);
                return false;
            }
            return true;
        }
    }

}