<?php

/* @var $this \yii\web\View */
/* @var $content string */

use backend\assets\AppAsset;
use yii\bootstrap4\Alert;
use yii\helpers\Html;
use yii\bootstrap4\Nav;
use yii\bootstrap4\NavBar;
use yii\bootstrap4\Breadcrumbs;
AppAsset::register($this);
//use kartik\icons\FontAwesomeAsset;
//FontAwesomeAsset::register($this);

?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => Yii::$app->name,
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'fixed-top navbar-expand-lg navbar-dark bg-dark',
        ],
    ]);
    $menuItems = [
        ['label' => 'Последние 10 постов', 'url' => 'http://i.ballroom.ru'],
        ['label' => 'Пользователи', 'url' => ['/site/index']],
        ['label' => 'Логи загрузки', 'url' => ['/site/log']],
        ['label' => 'Параметры  и описание ситуации', 'url' => ['/site/cron']],
    ];
    if (Yii::$app->user->isGuest) {
        $menuItems[] = ['label' => 'Login', 'url' => ['/site/login']];
    } else {
        $menuItems[] = '<li>'
            . Html::beginForm(['/site/logout'], 'post')
            . Html::submitButton(
                'Выйти (' . Yii::$app->user->identity->username . ')',
                ['class' => 'btn-sm btn-primary']
            )
            . Html::endForm()
            . '</li>';
    }
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav ml-auto'],
        'items' => $menuItems,
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>

        <div class="d-flex flex-column-fluid">
            <!--begin::Container-->
            <div class="container flex-fill">
                <?php if (Yii::$app->session->hasFlash('success')): ?>

                    <div class="alert alert-custom alert-success alert-shadow fade show gutter-b" role="alert">
                        <div class="alert-icon">
                            <i class="flaticon-user-ok"></i>
                        </div>
                        <div class="alert-text text-black-50"><?= Yii::$app->session->getFlash('success'); ?></div>
                        <div class="alert-close">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
																	<span aria-hidden="true">
																		<i class="ki ki-close"></i>
																	</span>
                            </button>
                        </div>
                    </div>

                <?php endif?>
                <?php if (Yii::$app->session->hasFlash('error')): ?>

                    <div class="alert alert-custom alert-danger alert-shadow fade show gutter-b" role="alert">
                        <div class="alert-icon">
                            <i class="flaticon-alarm"></i>
                        </div>
                        <div class="alert-text"><?= Yii::$app->session->getFlash('error'); ?></div>
                        <div class="alert-close">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
																	<span aria-hidden="true">
																		<i class="ki ki-close"></i>
																	</span>
                            </button>
                        </div>
                    </div>

                <?php endif?>



            </div>
            <!--end::Container-->
        </div>







        <?= $content ?>
    </div>
</div>
<footer class="footer fixed-bottom">
    <div class="container">
        <p class="float-left">&copy; dMITry Krivoshchekov (<a href="mailto:mit@krivoshchekov.ru">mit@krivoshchekov.ru</a>) <?= date('Y') ?></p>
    </div>
</footer>
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
