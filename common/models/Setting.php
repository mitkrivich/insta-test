<?php


namespace common\models;
/**
 * Таблица настроек.
 *
 * @property integer $updateMinute
 * @property boolean $enable
 */

use yii\db\ActiveRecord;

class Setting extends ActiveRecord
{
    public static function tableName()
    {
        return 'setting';
    }
    public function rules()
    {
        return [
            ['updateMinute', 'required'],
            ['enable', 'boolean'],
            ['updateMinute', 'number'],
            ['proxy', 'string'],
        ];
    }

}