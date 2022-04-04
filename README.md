# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| real_name          | string | null: false               |
| birthday           | string | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :deliveries

## items テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | integer    | null: false                    |
| state         | integer    | null: false                    |
| postage       | integer    | null: false                    |
| area          | integer    | null: false                    |
| delivery_time | integer    | null: false                    |
| price         | string     | null: false                    |
| comment       | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| order         | references | null: false, foreign_key: true |
| delivery      | references | null: false, foreign_key: true |
| seller        | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :deliveries
- has_one :orders

## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | string     | null: false                    |
| delivery  | references | null: false, foreign_key: true |
| buyer     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :items
- belongs_to :deliveries

## deliveries テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| card_number   | string     | null: false                    |
| card_expiry   | integer    | null: false                    |
| card_cvc      | string     | null: false                    |
| postcode      | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| user          | string     | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_many :orders
- has_many :items