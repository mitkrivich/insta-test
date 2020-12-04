<?php

use yii\db\Expression;
use yii\db\Migration;

/**
 * Handles the creation for table `{{%posts}}`.
 */
class m201204_102400_create_table_posts extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
        $this->createTable('{{%posts}}', [

            'postId' => $this->primaryKey()->notNull(),
            'instagramId' => $this->string(50)->notNull()->comment("Внутренний ID Instagtam"),
            'nickId' => $this->integer()->notNull()->comment("NickId из локальной таблицы Instagram"),
            'createdTime' => $this->integer()->notNull()->comment("Время создания post"),
            'linkUrl' => $this->string(255)->comment("Ссылка на post"),
            'type' => $this->string(10)->notNull()->comment("Тип поста"),
            'imageUrl' => $this->text()->comment("URL картинки"),
            'videoUrl' => $this->text()->comment("URL Video"),
            'locationName' => $this->string(255)->comment("Локация"),
            'caption' => $this->text()->comment("Текст Сообщения"),
            'likesCount' => $this->integer()->comment("Количество лайков"),
            'commentsCount' => $this->integer()->comment("Количество комментариев"),

        ]);
        $this->createIndex('createdTimeKey', '{{%posts}}', new Expression('createdTime'));
        $this->createIndex('instagramKey', '{{%posts}}', new Expression('instagramId'));
     }


    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        $this->dropIndex('createdTimeKey', '{{%posts}}');
        $this->dropIndex('instagramKey', '{{%posts}}');
        $this->dropTable('{{%posts}}');
    }
}
