<?php


namespace common\models;


use InstagramScraper\Instagram;
use Phpfastcache\Helper\Psr16Adapter;
use Yii;
/**
 * Форма добавления нового пользователя
*/

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

    public function  validateName($attribute) {
        try {
             $instagram = Instagram::withCredentials(new \GuzzleHttp\Client(['proxy' =>Yii::$app->params['proxy']]), Yii::$app->params['instaLogin'], Yii::$app->params['instaPass'], new Psr16Adapter('files'));
             $instagram->setUserAgent('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36');
             $instagram->setCustomCookies($newCookie);
             $instagram->login();
             $instagram->saveSession();
             $account = $instagram->getAccount($this->name);
            //если закрытый аккаунт от нас сообщаем об этом
            if ($account->isPrivate()) {
                $this->addError($attribute, 'Пользователь закрыл доступ к своему аккаунту и я на него не подписан. :(');
                $this->isPrivate=true;
                $this->closedFullName=$account->getFullName();
                $this->closedPicture=$account->getProfilePicUrlHd();
                $this->closedMediaCount=$account->getMediaCount();
                $this->closedFollowedByCount=$account->getFollowedByCount();
                $this->closedFollowsCount=$account->getFollowsCount();
            }
            else {
                $this->isPrivate = false;
                $instagramTable=InstagramTable::find()->where(['instagramId'=>$account->getId()])->one();
                if ($instagramTable) {
                        $this->addError($attribute, 'Данный пользователь уже есть в списке');
                }

                 else {
                        $this->fullName = $account->getFullName();
                        $this->instagramId = $account->getId();
                        $this->mediaCount = $account->getMediaCount();
                        $this->avatarUrl = $account->getProfilePicUrlHd();
                        $this->followedByCount = $account->getFollowedByCount();
                        $this->followsCount = $account->getFollowsCount();
                    }

            }
        }
        catch (\Exception $exception) {
             $this->addError($attribute, $exception->getMessage());
        }
    }


}