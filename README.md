# アプリ名

with My HAMSTER -ハムスター育成日記-

# 概要

ユーザーが育てているハムスターの育成日記です。画像と日記を投稿できて、<br>
マイページには自分専用の育成日記を観覧、編集、削除できる。<br>
投稿一覧ページは各ユーザーが投稿した画像と日記を観覧できて、コメントも書くことができる。

# 本番環境

https://ham-app-36433.herokuapp.com/

Basic認証<br>
・ユーザー名　：　napa<br>
・パスワード　：　0120

ログイン情報（テスト用）<br>
・Eメール　：　napa@napa.com<br>
・パスワード　：　123456

# 制作背景(意図)

私は初めて自分でハムスターを育てて色んな楽しさを知りました。<br>
ただ、ハムスターの１日は人間にとって１ヶ月にもなります。ハムスターの寿命はゴールデンで３年ドワーフで２年ほど。<br>
一緒に過ごす時間がとても短いのでハムスターと過ごす１日１日を大切に楽しく過ごすためにこの育成日記を使って、<br>
できるだけ多くのハムスターと飼い主さんとのきずなを深めるために使っていたいと思い、<br>
アプリケーションを作成いたしました。

# 使用技術(開発環境)

## バックエンド
Ruby,Ruby on Rails

## フロントエンド
JavaScript

## データベース
MySQL,Sequel Pro

## 本番環境
Heroku

## ソース管理
GitHub,GitHubDesktop

## エディタ
VSCode

# 課題や今後実装したい機能

・ハムスターについて詳しく紹介するページを作成<br>
・ハムスターのグッズ、食べ物を外部のリンクはを貼り付けて購入できるページに遷移できるようにする。<br>
・投稿画像のサイズが固定されていないので、画像サイズを固定させたい。<br>
・HTML/CSSをもっと工夫させて、見た目を充実させたい。<br>

# データベース設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false, unique: true |
| hamster_name       | string | null: false               |
| profile            | text   | null: false               |
    
- has_many :diarys
- has_many :comments

## diariesテーブル
| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| title  | string     | null: false       |
| text   | references | null: false       |
| user   | references | foreign_key: true |

- belongs_to :user
- has_many :diarys

## commentsテーブル
| Column       | Type       | Options           |
| ------------ | ---------- | ------------------|
| comment_text | references | null: false       |
| diary        | references | foreign_key: true |
| user         | references | foreign_key: true |

- belongs_to :diary
- belongs_to :user

