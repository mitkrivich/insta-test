<?php
/* @var $this yii\web\View */
/* @var $model \backend\models\CronForm */
use yii\bootstrap4\ActiveForm;
use yii\bootstrap4\Html;
$this->title = 'Тест для Instagram :: Управление процессом обновления ленты';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-index">
    <div class="body-content mb-5">
        <h3>Настройка обновления ленты</h3>
<?php
$form = ActiveForm::begin(['id' => 'instagram-form']); ?>
<div class="form-group">
    <?= $form->field($model, 'updateMinute')->textInput(['autofocus' => true])  ?>
</div>
    <div class="form-group">
        <?= $form->field($model, 'enable')->checkbox();?>
    </div>
    <div class="form-group">
        <?= $form->field($model, 'proxy')->textInput()  ?>
    </div>

<div class="form-group">
    <?= Html::submitButton('Изменить', ['class' => 'btn btn-primary btn-block', 'name' => 'login-button']) ?>
</div>
<?php ActiveForm::end();?>
   <P>Загрузка информации из Инстаграм осуществляется через консольный контроллер, который добавлен в cron.
   <P>Доступ к инстаграм осуществляется через компонент InstagramScraper по логину паролю. Почему через него?
   <P>У меня есть официальный hash-код доступа, через официальное API, но оно дает доступ только к моей странице. Для получения доступа ко всем данным нужно получать статус бизнес приложения, что для тестового задания я не вижу смысла делать.
   <P>На моем локальном компьютере все работает, что можно наблюдать по логам базы, которую я развернул сегодня.
   <P>На сервере до сегодняшнего дня тоже работало, но я так понимаю что Instagram блокирует Ip хостинга. Спасали платные proxy, но мои в данный момент закончились.
   <P>В поле proxy можно ввести свой вариант, возможно он будет рабочим. В данный момент автобновление я отключил. Оно может быть включено.
   <P>Воевать больше с инстаграм в рамках данного задания я больше не могу. Определенные знания по YII2, реализованы в данном проекте.
            <OL>
            <li>Верстка bootstrap 4;
            <li>Использование фреймворка Yii2;
            <li>Frontend and Backend зона;
            <li>Работа с контроллерами в том числе и консольным;
            </ol>


