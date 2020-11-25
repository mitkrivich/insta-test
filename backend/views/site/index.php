<?php

/* @var $this yii\web\View */


use kartik\grid\GridView;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\VarDumper;
use yii\widgets\Pjax;

$this->title = 'Тест для Instagram :: BackEnd';
Url::remember();
?>
<div class="site-index">
    <div class="body-content ">
        <h3>Список пользователей</h3>

        <div class="card card-custom gutter-b table-responsive-lg">
            <div class="card-body">
                <?php
                //VarDumper::dump($ip,10,true);
                //VarDumper::dump($dataProvider,10,true);
                echo Html::a(
                    '<i class="flaticon2-add"></i> '
                    . 'Добавить пользователя'
                    ,
                    ['add'],
                    [
                        'class' => 'btn btn-primary',
                    ]
                );
                ?>
                <?php Pjax::begin(['timeout' => 10000, 'enablePushState' => false]); ?>

                <?= GridView::widget([
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'options'=>['class' => 'table table-striped'],



                    'pager' => [
                        'class' => \yii\bootstrap4\LinkPager::class,
                        'maxButtonCount' => 10, // максимум 5 кнопок
                    ],
                    'columns' => [
                        [
                            'attribute' => 'id',
                            'contentOptions' => [
                                'class' => 'notFormEdit',
                                'style' => 'width:100px;  min-width:80px;  '
                            ],
                        ],
                        [
                            'attribute' => 'avatarUrl',
                            'format' => 'raw',
                            'value' => function($model){
                                return Html::img($model->avatarUrl,['class' => 'rounded-circle w-100']);

                            },
                            'contentOptions' => [
                                'class' => 'notFormEdit',
                                'style' => 'width:100px;  min-width:50px;  '
                            ],

                        ],
                        [
                            'attribute' => 'instagramId',
                            'contentOptions' => [
                                'class' => 'notFormEdit',
                                'style' => 'width:50px;  min-width:50px;  '
                            ],


                        ],
                        [
                            'attribute' => 'name',
                            'format' => 'raw',
                            'value' => function($model){
                                return Html::a($model->name, Url::to('https://instagram.com/'.$model->name),['target'=>'_blank']).'<BR>'.$model->fullName;
                            },
                        ],
                        [
                            'attribute' => 'mediaCount',
                            'format' => 'raw',
                            'value' => function($model){
                                return Html::a($model->mediaCount,['posts','id' => $model->id]);
                            },
                        ],
                        [
                            'attribute' => 'followsCount',
                        ],
                        [
                            'attribute' => 'followedByCount',
                        ],


                        [
                            'class' => 'yii\grid\ActionColumn',
                            'template' => '{delete}',
                            'header'=>'Действия',
                            'contentOptions' => [
                                'class' => 'notFormEdit',
                                'style' => 'width:50px;  min-width:50px;  '
                            ],
                            'buttons' => [
                                'delete' => function ($url, $model) {

                                    return Html::a(
                                        '<span>Удалить</span>',
                                        $url,
                                        [
                                            'title' => 'Удалить пользователя',
                                            'class' => 'btn btn-danger btn-icon mb-1',
                                            'data-confirm' => 'Вы уверены, что хотите удалить пользователя?'
                                        ]
                                    );
                                },
                            ],
                        ],

                    ],

                ]);
                ?>
                <?php Pjax::end(); ?>
            </div>
        </div>



    </div>
</div>
