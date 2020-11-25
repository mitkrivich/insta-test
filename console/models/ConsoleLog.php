<?php
namespace console\models;
/**
 * Таблица настроек.
 *
 * @property integer $id
 * @property string $theDate
 * @property string $textLog
 * @property boolean $isError
 *
 */


class ConsoleLog extends \yii\db\ActiveRecord
{
    public static function tableName()
    {
        return 'consolelog';
    }

}