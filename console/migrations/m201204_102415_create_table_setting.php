<?php

use yii\db\Migration;

/**
 * Handles the creation for table `{{%setting}}`.
 */
class m201204_102415_create_table_setting extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
        $this->createTable('{{%setting}}', [
            'id' => $this->primaryKey()->notNull(),
            'genDate' => $this->datetime()->notNull()->defaultValue(new \yii\db\Expression('NOW()'))->comment("Дата последнего обновления"),
            'updateMinute' => $this->integer()->notNull()->defaultValue(10)->comment("Обновление"),
            'enable' => $this->boolean()->notNull()->defaultValue(0)->comment("Включено"),
            'proxy' => $this->string(255),
        ]);
        $this->insert('{{%setting}}', array('proxy'=>''));

    }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        $this->dropTable('{{%setting}}');
    }
}
