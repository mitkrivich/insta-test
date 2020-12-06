<?php

use yii\db\Migration;

class m130524_201442_init extends Migration
{
    public function up()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') {
            // http://stackoverflow.com/questions/766809/whats-the-difference-between-utf8-general-ci-and-utf8-unicode-ci
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_bin ENGINE=InnoDB';
        }

        $this->createTable('{{%user}}', [
            'id' => $this->primaryKey(),
            'username' => $this->string()->notNull()->unique(),
            'auth_key' => $this->string(32)->notNull(),
            'password_hash' => $this->string()->notNull(),
            'password_reset_token' => $this->string()->unique(),
            'email' => $this->string()->notNull()->unique(),

            'status' => $this->smallInteger()->notNull()->defaultValue(10),
            'created_at' => $this->integer()->notNull(),
            'updated_at' => $this->integer()->notNull(),
        ], $tableOptions);
        $curtime=time();
        $this->insert('{{%user}}', array('username'=>'admin',
                'password_hash'=>Yii::$app->security->generatePasswordHash('12345678'),
                'auth_key'=>'auth_key',
                 'email'=>'mit@krivoshchekov.ru',
                'status'=>'10','created_at'=>$curtime,'updated_at'=>$curtime


        ));
    }

    public function down()
    {
        $this->dropTable('{{%user}}');
    }
}
