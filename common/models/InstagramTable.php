<?php
namespace common\models;
use yii\db\ActiveRecord;
use yii\helpers\Console;

/**
* Таблица пользователей инстаграм для загрузки.
 *
 * @property integer $id
 * @property string $name
 * @property string $fullName
 * @property string $biography
 * @property string $avatarUrl
 * @property string $followsCount //Подписок
 * @property string $followedByCount //Подписчиков
 * @property string $mediaCount //Публикаций

 */

class InstagramTable extends ActiveRecord
{
    public static function tableName()
    {
        return 'instagram';
    }
    public function attributeLabels()
    {
        return [
            'name' => 'Имя пользователя',
            'fullName' => 'Полное имя',
            'instagramId' => 'Id',
            'id' => '#',
            'avatarUrl' => 'Фото',
            'mediaCount' => 'Публ.',
            'followsCount'=>'Подписок',
            'followedByCount'=>'Подпиcчиков',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPosts()
    {
        return $this->hasMany(Posts::class, ['nickId' => 'id']);
    }

    public function beforeDelete()
    {
        if (!parent::beforeDelete()) {
            return false;
        }

        $this->deleteChildren();
        return true;
    }


    public function deleteChildren()
    {
        foreach ($this->getPosts()->all() as $child) {
            $child->delete();
        }
    }

    /**
     * Загрузка постов пользователя
     * @return boolean
     */
    public function loadPosts($media,$console)
    {
        $postCount=0;
        foreach ($media as $row) {
            $postCount++;
            $postId = $row->getId();

//                проверка на существование поста в локальном БД
            $post = Posts::find()->where(['instagramId' => $postId])->one();

            //VarDumper::dump($post,10,true);
            if (!$post) {
                $console->stdout($this->name.' ('.$this->fullName. ') new post', Console::FG_GREY);
                $console->stdout(PHP_EOL);
                $post = new Posts();
            }
            $post->instagramId = $postId;
            $post->nickId = $this->id;
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
                        $caruselTable->nickId = $this->id;
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
       return true;
    }
    /**
     * Загрузка информации о пользователе
     * @return boolean
     */
        public function loadInfo($instagram,$console)
    {

            try {
                sleep (1); //делаем паузу чтобы не приняли за робота. Но не помогает :)
                $account = $instagram->getAccountById($this->instagramId);
                $media = $account->getMedias();
                $postCount = 0;
                $this->instagramId = $account->getId();
                $this->fullName = $account->getFullName();
                $this->biography = $account->getBiography();
                $this->avatarUrl = $account->getProfilePicUrlHd();
                $this->followsCount = $account->getFollowsCount();
                $this->followedByCount = $account->getFollowedByCount();
                $this->mediaCount = $account->getMediaCount();
                $this->save(false);
                $this->loadPosts($media,$console);
            }
            catch (\Exception $ex) {
                //Ошибка в получении данных по пользователю
                $ex->getMessage();
                $console->stdout('!!!Error '.$this->name.', '.$ex->getMessage(), Console::FG_RED, Console::BLINK);
                $console->stdout(PHP_EOL);
                $console->isError=true;
            //    $mutex->release($mutexName);
                //    return false;
            }



    }




}