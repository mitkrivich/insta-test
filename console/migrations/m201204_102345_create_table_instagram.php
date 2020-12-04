<?php

use yii\db\Expression;
use yii\db\Migration;

/**
 * Handles the creation for table `{{%instagram}}`.
 */
class m201204_102345_create_table_instagram extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
        $this->createTable('{{%instagram}}', [

            'id' => $this->primaryKey()->notNull(),
            'instagramId' => $this->integer()->notNull()->comment("instagramId"),
            'name' => $this->string(255)->notNull()->comment("Nick"),
            'fullName' => $this->string(255)->comment("Полное имя"),
            'avatarUrl' => $this->string(1000)->comment("Ссылка на аватар"),
            'biography' => $this->text()->comment("Биография"),
            'followsCount' => $this->integer()->comment("Подписок"),
            'followedByCount' => $this->integer()->comment("Подписчиков"),
            'mediaCount' => $this->integer()->comment("Количество публикаций"),

        ]);
        $this->createIndex('nameKey', '{{%instagram}}', new Expression('name'));

    }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        $this->dropIndex('nameKey', '{{%instagram}}');
        $this->dropTable('{{%instagram}}');
    }
}
