<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap4\ActiveForm;
use yii\helpers\Url;

$this->title = 'Instagram Test :: Backend';
?>
<div class="site-login">
    <a href="\" class="btn btn-primary btn-block"><i class=""></i>Вернуться на главную страницу</a>

    <H2>Авторизация</H2>

    <p>Для доступа в административную зону (Backend) следует ввести логин и пароль из почты:</p>


            <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>

                <?= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>

                <?= $form->field($model, 'password')->passwordInput() ?>

                <?= $form->field($model, 'rememberMe')->checkbox() ?>

                <div class="form-group">
                    <?= Html::submitButton('Перейти в Backend', ['class' => 'btn btn-primary btn-block', 'name' => 'login-button']) ?>
                </div>

            <?php ActiveForm::end(); ?>
</div>