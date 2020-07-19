# README

# アプリ名
  "Mitsumane"

# 概要
  見積りを登録して管理できるアプリ<br>
  <主な内容><br>
  見積りの登録 — 削除・編集 <br>
  見積りの一覧 - 見積りの閲覧 売上・利益合計の確認
  検索機能 — 登録条件での検索<br>
  マイページ（見積もりの売上・利益の合計金額の確認 見積りの閲覧）<br>

# 本番環境
  http://175.41.229.0/
  テストアカウント
  email: aaaaa@gmail.com
  passward: 12345678

# 制作背景
  <問題><br>
  現在の仕事(営業職)で、見積り管理が個人での管理となっている<br>
  <解決><br>
  部署内で見積りを共有し誰でも閲覧できるようにする<br>

# 工夫したポイント
  検索機能を実装し探したい見積りを検索できるようした

# 使用技術(開発環境)
  ruby (2.5.1)<br>
  Rails (5.0.7.2)<br>
  jquery-rails (4.4.0)<br>
  MySQL (5.6.46)<br>

# 課題や今後実装したい機能
  締め切り期限の通知<br>
  見積りの作成<br>

# DEMO
  ![ff05775cd49754d7fc550ba9abdd857f.png](ff05775cd49754d7fc550ba9abdd857f.png)
  ![b99310243957292d211f390598725fd0.png](b99310243957292d211f390598725fd0.png)
  ![be235f9844d5c0a96ce479ea3d09c2db.png](be235f9844d5c0a96ce479ea3d09c2db.png)
  
# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
|company_name|string|
### Association Association
- has_many :estimates

## estimatesテーブル
|Column|Type|Options|
|------|----|-------|
|customer|string|null: false|
|get|datetime|null: false|
|deadline|datetime|null: false|
|name|string|null: false|
|figure_number|string|null: false|
|make|string|null: false|
|metal|string|null: false|
|start|datetime|
|use|string|
|quantity|integer|null: false|
|sell_price|integer|null: false|
|purchase_price|integer|null: false|
|profit|integer|null: false|
|sell_price_total|integer|null: false|
|profit_total|integer|null: false|
|probability_id|integer|null: false|
|status_id|integer|null: false|
|remark|text|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to_active_hash :probability
- belongs_to_active_hash :status

## probabilitiesテーブル
|Column|Type|Options|
|------|----|-------|
### Association
- activ-hach

## statusesテーブル
|Column|Type|Options|
|------|----|-------|

### Association
- activ-hach
