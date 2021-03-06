<?php
/* @var $this yii\web\View */
use yii\helpers\Html;
$this->title = 'Тестовое задание про Инстаграм';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-about">
    <h3><?= Html::encode($this->title) ?></h3>
    <p>Нужно сделать страницу, на которой будут показываться 10 последних постов определённых пользователей Инстаграм. Должна быть возможность изменять список пользователей, сами посты нужно обновлять каждые 10 минут.
    <p class="alert-danger">Примечание: нужно показывать 10 последних постов из общего списка постов пользователей, а не 10 последних постов для каждого из пользователей.
    <p>При выполнении задания должна быть реализована связка "бэкенда" и "фронтенда", хотя бы в каком-то элементарном виде, которую можно будет протестировать получив доступ к “фронтенду” через браузер.
    <p>Более мы не ограничиваем исполнителя в способе реализации: все моменты которые НЕ оговорены в задании - остаются на Ваше усмотрение.
</div>
