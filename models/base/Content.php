<?php
// This class was automatically generated by a giiant build task
// You should not change it manually as it will be overwritten on next build

namespace app\models\base;

use Yii;

/**
 * This is the base-model class for table "content".
 *
 * @property integer $id
 * @property string $title
 * @property string $keyword
 * @property string $content
 * @property integer $menu_id
 *
 * @property \app\models\Menu $menu
 * @property string $aliasModel
 */
abstract class Content extends \yii\db\ActiveRecord
{



    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'content';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'content', 'menu_id'], 'required'],
            [['content'], 'string'],
            [['menu_id'], 'integer'],
            [['title', 'keyword'], 'string', 'max' => 255],
            [['menu_id'], 'exist', 'skipOnError' => true, 'targetClass' => \app\models\Menu::className(), 'targetAttribute' => ['menu_id' => 'id']]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'keyword' => Yii::t('app', 'Keyword'),
            'content' => Yii::t('app', 'Content'),
            'menu_id' => Yii::t('app', 'Menu ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMenu()
    {
        return $this->hasOne(\app\models\Menu::className(), ['id' => 'menu_id']);
    }




}