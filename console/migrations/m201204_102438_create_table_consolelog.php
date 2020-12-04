<?php

use yii\db\Migration;

/**
 * Handles the creation for table `{{%consolelog}}`.
 */
class m201204_102438_create_table_consolelog extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
        $this->createTable('{{%consolelog}}', [

            'id' => $this->primaryKey()->notNull(),
            'theDate' => $this->datetime()->notNull()->defaultValue(new \yii\db\Expression('NOW()')),
            'textLog' => $this->text(),
            'isError' => $this->boolean()->notNull(),

        ]);
     }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        $this->dropTable('{{%consolelog}}');
    }
}
