<?php


namespace backend\models;

use common\models\InstagramTable;
use common\models\Setting;
use InstagramScraper\Instagram;
use Phpfastcache\Helper\Psr16Adapter;
use Yii;

class InstaForm extends InstagramTable
{
 public $isPrivate=false;  //закрытый аккаунт
 public $closedFullName='';
 public $closedPicture='';
 public $closedFollowsCount;
 public $closedFollowedByCount;
 public $closedMediaCount;


    public function rules()
    {
         return [
             ['name', 'required'],
             ['name', 'string'],
             ['name', 'validateName'],
         ];
    }
    public function attributeLabels()
    {
        return [
            'name' => 'Имя пользователя в Инстаграм',
        ];
    }

    /**
     * проверка на существование пользователя в инстаграм
     *
     * @return boolean
     */
    public function  validateName($attribute) {
        try {
            $setting=Setting::find()->one();
            $instagram =null;
            if ($setting->proxy=='')
             $instagram = Instagram::withCredentials(new \GuzzleHttp\Client(), Yii::$app->params['instaLogin'], Yii::$app->params['instaPass'], new Psr16Adapter('files'));
            else
             $instagram = Instagram::withCredentials(new \GuzzleHttp\Client(['proxy' => $setting->proxy]), Yii::$app->params['instaLogin'], Yii::$app->params['instaPass'], new Psr16Adapter('files'));
            $instagram->setUserAgent('Mozilla/6.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36');
            //$instagram->setCustomCookies($newCookie); //можно записать куки чтобы не авторизоваться каждый раз, отложили для будущей доработки
            $instagram->login();
            $instagram->saveSession();
            $account = $instagram->getAccount($this->name);
            //если закрытый аккаунт от нас сообщаем об этом
            if (!$account->getMedias()) {
                $text='Пользователь закрыл доступ к своему аккаунту и я на него не подписан. :(';
                $this->addError($attribute, $text);
                Yii::$app->session->setFlash('error', $text);
                $this->isPrivate=true;
                $this->closedFullName=$account->getFullName();
                $this->closedPicture=$account->getProfilePicUrlHd();
                $this->closedMediaCount=$account->getMediaCount();
                $this->closedFollowedByCount=$account->getFollowedByCount();
                $this->closedFollowsCount=$account->getFollowsCount();
            //    VarDumper::dump($account, 10, true);
            }
            else {
                $this->isPrivate = false;
                $instagramTable=InstagramTable::find()->where(['instagramId'=>$account->getId()])->one();
                if ($instagramTable) {
                        $text='Данный пользователь уже есть в списке';
                        $this->addError($attribute, $text);
                        Yii::$app->session->setFlash('error', $text);
                        return false;
                }

                 else {
                      //  VarDumper::dump($account, 10, true);
                        $this->fullName = $account->getFullName();
                        $this->instagramId = $account->getId();
                        $this->mediaCount = $account->getMediaCount();
                        $this->avatarUrl = $account->getProfilePicUrlHd();
                        $this->followedByCount = $account->getFollowedByCount();
                        $this->followsCount = $account->getFollowsCount();
                    }

            }
            return true;
        }
        catch (\Exception $exception) {
        //     VarDumper::dump($account, 10, true);
             $text=$exception->getMessage();
             $this->addError($attribute, $text);
             Yii::$app->session->setFlash('error', $text);
        }




     //$this->addError('login','Данный логин уже занят. Попробуйте другой вариант.');
    }


}