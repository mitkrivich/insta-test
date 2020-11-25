<?php
namespace common\models;
use yii\db\ActiveRecord;

/**
 * Таблица постов пользователей инстаграм для загрузки.
 *
 * @property integer $postId
 * @property string $instagramId
 * @property integer $nickId
 * @property integer $createdTime
 * @property string  $type
 * @property string  $imageUrl
 * @property string  $videoUrl
 * @property string  $linkUrl
 * @property string  $locationName
 * @property string  $caption
 * @property string  $comments
 * @property integer $likesCount
 * @property integer $commentsCount
 */

class Posts extends ActiveRecord
{

    public static function tableName()
    {
        return 'posts';
    }

    /**
     * @inheritdoc
     * @return ActiveRecord
     */
    public function findCarusel($id)
    {
        return   Carusel::find()->where(['caruselId'=>$this->postId,'instagramid'=>$id])->one();

    }
    public function getUser()
    {
        return $this->hasOne(InstagramTable::class, ['id' => 'nickId']);
    }

    public function getCarusel()
    {
        return $this->hasMany(Carusel::class, ['caruselId' => 'postId']);
    }
   //---------------------------Удаляем  карусели-----------------------------------------------------------------------
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
        foreach ($this->getCarusel()->all() as $child) {
            $child->delete();
        }
    }


    public function getInstagram()
    {
        return $this->hasOne(InstagramTable::class, ['id' => 'nickId']);
    }



}