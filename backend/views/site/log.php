<?php
/* @var $this yii\web\View */
/* @var $console \console\models\ConsoleLog */
$this->title = 'Log обновления ленты';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-index">
    <div class="body-content">
        <div class="accordion" id="accordionExample">
            <?php
            $i=0;
            foreach ($model as $log):
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
                                <?=$log->theDate?>
                                <?php if ($log->isError): ?><span class="text-danger">Ошибка</span><?php endif;?>
                          </button>
                        </h2>
                    </div>
                    <div id="collapse<?=$i?>" class="<?=$classCollapse?>" aria-labelledby="heading<?=$i?>" data-parent="#accordionExample">
                         <div class="card-body"><?=nl2br($log->textLog)?>
                        </div>
                    </div>
               </div>
            <?endforeach; ?>
        </div>
    </div>
</div>

