<?php

namespace backend\models;
use common\models\Setting;
use Yii;
use yii\base\Model;
use yii\helpers\VarDumper;
use yii2tech\crontab\CronJob;
use yii2tech\crontab\CronTab;

class CronForm extends Model
{
 private $cronJob=null;
 private $setting=null;
 public $updateMinute=null;
 public $enable=null;
 public $proxy=null;
    public function rules()
    {
        return [
            ['updateMinute', 'required'],
            ['enable', 'boolean'],
            ['updateMinute', 'number'],
            ['proxy', 'string'],
        ];
    }
    public function attributeLabels()
    {
        return [
            'updateMinute' => 'Период  обновления ',
            'enable' => 'Обновление ленты включено',
            'proxy' => 'Прокси (пустое если не используется)',

        ];
    }

    public function __construct($config = [])
    {
        $setting=Setting::find()->one();
        $this->setting=Setting::find()->one();
        $this->updateMinute=$setting->updateMinute;
        $this->enable=$setting->enable;
        $this->proxy=$setting->proxy;
        $cronTab = new CronTab();
        $cronJobs=$cronTab->getLines();
  //      VarDumper::dump($cronJobs,10,true);
       // if (!$cronJobs) $this->enable='0';
        parent::__construct($config);
    }

    /**
     * изменение расписания
     *
     * @return boolean
     */
    public function initCron()
    {
        try {
               $cronTab = new CronTab();
               $cronTab->removeAll();
               $cronTab->apply();
               if ($this->enable=='1') {
                    $cronTab = new CronTab();
                    $cronJob = new CronJob();
                    $cronJob->setLine('*/' . $this->updateMinute.Yii::$app->params['cronLine']);
                    $cronTab->setJobs([$cronJob]);
                    $cronTab->apply();
                }
                //сохраняем изменения настроек
                $this->setting->enable = $this->enable;
                $this->setting->updateMinute = $this->updateMinute;
                $this->setting->proxy = $this->proxy;
                $this->setting->save(false);
                Yii::$app->session->setFlash('success', 'Изменения в планировщик задач успешно внесены');
                return true;
        }
        catch (\Exception $ex) {
            //Ошибка в работе с Cron
            Yii::$app->session->setFlash('error', $ex->getMessage());
            return false;
        }
    }

}