<?php
namespace backend\controllers;

use backend\models\CronForm;
use backend\models\InstaForm;
use common\models\InstagramSearch;
use common\models\InstagramTable;
use common\models\Posts;
use console\models\ConsoleLog;
use gaxz\crontab\models\CronTaskSearch;
use Yii;
use yii\helpers\VarDumper;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use yii\web\NotFoundHttpException;
use yii2tech\crontab\CronJob;
use yii2tech\crontab\CronTab;

/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['login', 'error'],
                        'allow' => true,
                    ],
                    [
                        'actions' => ['logout', 'index','update','add','cron','delete','log','posts'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
        ];
    }



    /**
     * получение записи из базы
     *
     * @return InstagramTable
     */
    protected function findTable($id)
    {
        if (($model = InstagramTable::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'Запись не найдена'));
        }
    }

    /**
     * настройка расписания
     *
     * @return string
     */
    public function actionCron()
    {
        $model=new CronForm();
        if ($model->load(Yii::$app->request->post()))
        {
            if($model->initCron())
                return $this->redirect(['site/index']);
        }
        return $this->render('cron',['model'=>$model]);
    }

    /**
     * добавление нового пользователя Instagram
     *
     * @return string
     */
    public function actionAdd()
    {
        $model=new InstaForm();
        if ($model->load(Yii::$app->request->post()))
            if($model->validate())
            {
              $model->save(false);

              return $this->redirect(['site/index']);
            }
        return $this->render('update',['model'=>$model]);
    }

    /**
     * просмотр постов пользователя
     *
     * @return string
     */
    public function actionPosts($id)
    {
        $model=Posts::find()->where(['nickId'=>$id])->orderBy('postId DESC')->all();
        $user=InstagramTable::find()->where(['id'=>$id])->one();
        return $this->render('posts',['model'=>$model,'user'=>$user]);
    }

    /**
     * Вывод логов.
     *
     * @return string
     */
    public function actionLog()
    {
        $model=ConsoleLog::find()->orderBy('id Desc')->limit(20)->all();
        return $this->render('log',['model'=>$model]);
    }


    /**
     * Index delete.
     *
     * @return string
     */
    public function actionDelete($id)
    {
        $model = $this->findTable($id);
    //    VarDumper::dump($model->posts,10,true);
        $model->delete();
        return $this->redirect(['index']);
    }


    /**
     * Index action.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new InstagramSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('index',['dataProvider'=>$dataProvider,
            'searchModel'=>$searchModel
        ]);
    }

    /**
     * Login action.
     *
     * @return string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $this->layout = 'blank';

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            $model->password = '';

            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logout action.
     *
     * @return string
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }
}
