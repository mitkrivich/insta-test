<?php
namespace common\models;
use yii\db\ActiveRecord;
/**
 * Таблица имходных карулселей для постов пользователей инстаграм для загрузки.
 * не реализован просмотр
 *
 * @property integer $postId
 * @property integer $caruselId
 * @property string $instagramId
 * @property integer $nickId
 * @property integer $createdTime
 * @property string  $type
 * @property string  $imageUrl
 * @property string  $videoUrl
 *
 */

class Carusel extends ActiveRecord
{
    public static function tableName()
    {
        return 'carusel';
    }
}