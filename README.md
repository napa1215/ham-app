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




