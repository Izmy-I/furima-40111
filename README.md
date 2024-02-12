# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birth_day          | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item_name       | string     | null: false |
| description     | text       | null: false |
| category        | integer    | null: false |
| condition       | integer    | null: false |
| fee-pay         | integer    | null: false |
| sell_prefecture | integer    | null: false |
| delivery_days   | integer    | null: false |
| price           | integer    | null: false |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| item_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destination テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| post_code      | integer    | null: false |
| buy_prefecture | integer    | null: false |
| city           | string     | null: false |
| address        | string     | null: false |
| building       | string     |             |
| phone_num      | integer    | null: false |
| purchase_id    | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase