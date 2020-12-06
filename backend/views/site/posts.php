<?php
/* @var $this yii\web\View */
/* @var $model \common\models\Posts */
/* @var $user \common\models\User */
use yii\helpers\Html;
$this->title = $user->name.':: Посты пользователя';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-index">


    <div class="body-content">

        <div class="accordion" id="accordionExample">
            <?php
            $i=0;
            foreach ($model as $post):
                $i++;
                $collapsed='collapsed';
                $classCollapse='collapse show';


                if ($i!=1) {
                    $collapsed = '';
                    $classCollapse='collapse';
                }
                ?>
            <div class="card">
                <div class="card-header" id="heading<?=$i?>">
                    <h2 class="mb-0">
                        <button class="btn btn-link btn-block text-left <?=$collapsed ?>" type="button" data-toggle="collapse" data-target="#collapse<?=$i?>" aria-expanded="true" aria-controls="collapse<?=$i?>">
                            <?=$post->instagramId?>,&nbsp;<?=Yii::$app->formatter->asDatetime($post->createdTime) ?>
                        </button>
                    </h2>
                </div>

                <div id="collapse<?=$i?>" class="<?=$classCollapse?>" aria-labelledby="heading<?=$i?>" data-parent="#accordionExample">
                    <div class="card-body">
                        <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6"><?= Html::img($post->imageUrl,['class' => 'img-responsive img-fluid']); ?></div>
                        <div class="col-lg-6 col-md-6 col-sm-6"><?=nl2br($post->caption)?></div>

                        </div>
                    </div>
                </div>
            </div>
            <?endforeach; ?>
        </div>


    </div>
</div>

