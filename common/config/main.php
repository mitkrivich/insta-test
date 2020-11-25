<?php
return [
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm'   => '@vendor/npm-asset',
    ],
    'id' => 'your-id',
    'name' => 'Instagram Test',
    'language' => 'ru-RU',
    'timeZone' => 'Europe/Moscow',
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'components' => [

        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'queue' => [
            'class' => \yii\queue\file\Queue::class,
            'as log' => \yii\queue\LogBehavior::class,
        ],
    ],
];
