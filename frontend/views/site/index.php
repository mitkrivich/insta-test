<?php
/* @var $this yii\web\View */
/* @var $model Posts */
/* @var $setting Setting */
use common\models\Posts;
use common\models\Setting;
use yii\helpers\Html;
$this->title = 'Тест для Instagram :: Последние 10 постов выбранных пользователей';
?>
<div class="site-index">
    <div class="body-content">
        <?php
        $interval=$setting->updateMinute*1000*60;
        $script = <<< JS
                $(document).ready(function() {
                setInterval(function(){ $("#refreshButton").click(); }, $interval);
                });
                JS;
        $this->registerJs($script);
        ?>
        <BR>
        <?= Html::a("Обновить", ['site/index'], ['class' => 'btn btn-primary', 'id' => 'refreshButton']) ?>
        <p class="text-muted">Информация актуальна на: <?= date("d.m.Y H:i:s",strtotime($setting->genDate))  ?></p>
        <div class="row">
            <?php   foreach ($model as $post):?>
            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-4  align-content-center">
                <blockquote class="instagram-media" data-instgrm-captioned data-instgrm-version="6" style=" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:350px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);">
                    <div style="padding:8px;">
                        <div style=" background:#F8F8F8; line-height:0; margin-top:40px; padding:50.0% 0; text-align:center; width:100%;">
                            <div style=" background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAMAAAApWqozAAAAGFBMVEUiIiI9PT0eHh4gIB4hIBkcHBwcHBwcHBydr+JQAAAACHRSTlMABA4YHyQsM5jtaMwAAADfSURBVDjL7ZVBEgMhCAQBAf//42xcNbpAqakcM0ftUmFAAIBE81IqBJdS3lS6zs3bIpB9WED3YYXFPmHRfT8sgyrCP1x8uEUxLMzNWElFOYCV6mHWWwMzdPEKHlhLw7NWJqkHc4uIZphavDzA2JPzUDsBZziNae2S6owH8xPmX8G7zzgKEOPUoYHvGz1TBCxMkd3kwNVbU0gKHkx+iZILf77IofhrY1nYFnB/lQPb79drWOyJVa/DAvg9B/rLB4cC+Nqgdz/TvBbBnr6GBReqn/nRmDgaQEej7WhonozjF+Y2I/fZou/qAAAAAElFTkSuQmCC); display:block; height:44px; margin:0 auto -44px; position:relative; top:-22px; width:44px;"></div>
                        </div>
                        <p style=" margin:8px 0 0 0; padding:0 4px;"><a href="<?= $post->linkUrl?>" style=" color:#000; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none; word-wrap:break-word;" target="_blank"></p>
                    </div></blockquote>
            </div>
            <?endforeach; ?>
        </div>

        <script async defer src="//platform.instagram.com/ru_RU/embeds.js"></script>
        <span class="border-top my-3"></span>

        </div>

    </div>


</div>
