<?php


namespace common\models;


use yii\data\ActiveDataProvider;
/**
 * Вывод пользователей в таблице
 */

class InstagramSearch extends InstagramTable
{
    public function rules()
    {
        return [
            [['name','fullName'], 'string'],
            [['id','instagramId'], 'number'],
        ];
    }

    public function search($params)
    {

        $query = InstagramTable::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        //    'sort' => ['attributes' => ['id','instagramId','name','fullName',]]
            'sort'=> ['defaultOrder' => ['id' => SORT_DESC],        ],
        ]);
        $dataProvider->pagination = ['pageSize' => 10];
        $dataProvider->setSort(['attributes' => [
            'id'=> [
                    'asc' => ['id' => SORT_DESC],
                    'desc'=>['id' => SORT_ASC]],
            'instagramId'=> [
                    'asc' => ['instagramId' => SORT_DESC],
                    'desc'=>['instagramId' => SORT_ASC]],
            'name'=> [
                    'asc' => ['name' => SORT_DESC],
                    'desc'=>['name' => SORT_ASC]],
            'mediaCount'=> [
                'asc' => ['mediaCount' => SORT_DESC],
                'desc'=>['mediaCount' => SORT_ASC]],
            'followsCount'=> [
                'asc' => ['followsCount' => SORT_DESC],
                'desc'=>['followsCount' => SORT_ASC]],
            'followedByCount'=> [
                'asc' => ['followedByCount' => SORT_DESC],
                'desc'=>['followedByCount' => SORT_ASC]],
        ]
        ]);
        $this->load($params);
        $query
           ->andFilterWhere(['like', 'name', $this->name])
           ->andFilterWhere(['like', 'instagramId', $this->instagramId])
           ->andFilterWhere(['like', 'id', $this->id]);
        return $dataProvider;
    }

}