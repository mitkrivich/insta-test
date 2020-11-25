<?php use yii\bootstrap4\ActiveForm;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\helpers\VarDumper;
$this->title = 'Тест для Instagram :: BackEnd :: Добавление пользователя в ленту';
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="site-index">


    <div class="body-content mb-5">
        <h3>Добавление пользователя в ленту</h3>

<?php
$form = ActiveForm::begin(['id' => 'instagram-form']); ?>

<?= $form->field($model, 'name')->textInput(['autofocus' => true]) ?>
<div class="form-group">
    <?= Html::submitButton('Добавить', ['class' => 'btn btn-primary btn-block', 'name' => 'login-button']) ?>
</div>
<?php ActiveForm::end();
 if ($model->isPrivate) { ?>
     <div class="modal-content">
         <div class="modal-header">
             <h5 class="modal-title"><strong>Пользователь в Instagram</strong></h5>
         </div>
         <div class="body-content mt-5 ml-1">

             <div class="row">
                 <div class="col-sm-3 col-lg-2">
                 <img src="<?=$model->closedPicture?>" class="img-responsive rounded-circle w-100" align="center" alt="<?=$model->name?>">
                 </div>
                 <div class="col-sm-9 col-lg-10">
                     <P>Пользователь: <strong><?=$model->name?></strong>
                     <BR>Полное имя: <strong><?=$model->closedFullName?></strong>
                     <BR>Подписок:  <strong><?=$model->closedFollowsCount?></strong>
                     <BR>Подписчиков: <strong><?=$model->closedFollowedByCount?></strong>
                     <BR>Публикаций: <strong><?=$model->closedMediaCount?></strong>
                     <P><a target="_blank" href="https://instagram.com/<?=$model->name?>"><button href="" type="button" class="btn btn-primary btn-block btn-bitbucket btn-shadow  mr-1">Посмотреть профилль</button></a>
                 </div>
             </div>



         </div>
       </div>



 <?}
?>
    </div>
</div>

