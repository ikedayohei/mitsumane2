# README

# アプリ名
  "Mitsumane"

# 概要
  見積もりを登録して管理できるアプリ<br>
  <主な内容><br>
  見積もりの登録 — 削除・編集 <br>
  見積もりの一覧 - 見積もり
  検索機能 — 登録条件での検索<br>
  マイページ（見積もりの合計金額の確認と見積もりの閲覧）<br>

# 本番環境
  https://dailyreportss.herokuapp.com/
  テストアカウント
  email: aaaaa@gmail.com
  passward: 12345678

# 制作背景
  <問題><br>
  現在の仕事(営業職)で、営業日報を報告することになっているが、担当と上司間でのやり取りとなっている<br>
  <解決><br>
  部署内で営業日報を共有し誰でも閲覧できるようにする<br>

# 工夫したポイント
  営業日報にコメント機能実装し部署内でコミニケーションを取れるようにした

# 使用技術(開発環境)
  ruby (2.6.3)<br>
  Rails (5.0.7.2)<br>
  jquery-rails (4.3.5)<br>
  MySQL (5.6.46)<br>

# 課題や今後実装したい機能
  マイページに閲覧履歴の追加<br>
  検索に詳細検索を追加<br>
  資料を投稿できるようにする<br>

# DEMO
  ![c2e406f448ee959a4f9e750fad0264ec.png](c2e406f448ee959a4f9e750fad0264ec.png)
  ![f47d1e3bb80b7bc27a109d35bc7c255.png](2f47d1e3bb80b7bc27a109d35bc7c255.png)
  ![bb71bc89abec619088fcab626f06851c.png](bb71bc89abec619088fcab626f06851c.png)
  ![6460c4eda176d55eb2bc763b7ff77d00.png](6460c4eda176d55eb2bc763b7ff77d00.png)
  ![4cad09f82a28d16699bd7ec50aa82f39.png](4cad09f82a28d16699bd7ec50aa82f39.png)
  
  
# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
### Association Association
- has_many :sns_credentials
- has_many :reports, dependent: :destroy
- has_many :bookmarks, dependent: :destroy
- has_many :bookmark_reports, through: :bookmarks, source: :report
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :sns_credentials

## reportsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|where|string|null: false|
|reponder|string|null: false|
|companion|string||
|date|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :commnets
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|report_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :report
- belongs_to :user

## companyテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|postcode|text|null: false|
|phone_number|string|null: false|
|capital|string|null: false|
|sale|string|null: false|
|description|string|null: false|
|characteristic|text|
|url|string|
|user_id|integer|null: false, foreign_key: true|
|report_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :companies
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user

## likeテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|company_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :company

## bookmarksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|report_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :report

## mapテーブル
|Column|Type|Options|
|------|----|-------|
|address|string|
|latitude|flot|
|longitude|string|flot|
### Association
- belongs to company

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string|
|user_id|integer|foreign_key: true|
### Association
- belongs_to :user,optional: true