<?php

use yii\db\Expression;
use yii\db\Migration;

/**
 * Handles the creation for table `{{%carusel}}`.
 */
class m201204_102454_create_table_carusel extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
        $this->createTable('{{%carusel}}', [

            'postId' => $this->primaryKey()->notNull(),
            'caruselId' => $this->integer()->notNull()->comment("Id основного поста"),
            'instagramId' => $this->string(50)->notNull()->comment("Внутренний ID Instagtam"),
            'nickId' => $this->integer()->notNull()->comment("NickId из локальной таблицы Instagram"),
            'createdTime' => $this->integer()->notNull()->comment("Время создания поста"),
            'type' => $this->string(10)->notNull()->comment("Тип поста"),
            'imageUrl' => $this->text()->comment("URL картинки"),
            'videoUrl' => $this->text()->comment("URL Video"),

        ]);
        $this->createIndex('instagramKey', '{{%carusel}}', new Expression('instagramId'));
     }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        $this->dropTable('{{%carusel}}');
    }
}
