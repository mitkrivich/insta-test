<?php
namespace common\models;
use yii\db\ActiveRecord;

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




}