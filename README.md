# README

## テーブル設計



### users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_in_kana | string  | null: false |
| last_name_in_kana  | string  | null: false |
| birthday           | integer | null: false |

#### Association

- has_many :products
- has_many :comments
- has_many :address



### products テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | text       | null: false                    |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| shipping_cost    | string     | null: false                    |
| ship_from        | string     | null: false                    |
| shipping_days    | string     | null: false                    |
| condition        | string     | null: false                    |
| category         | string     | null: false                    |
| trading_status   | boolean    | null: false                    |
| user_id (seller) | references | null: false, foreign_key: true |

#### Association

- belongs_to :user

- has_many :comments

  

### address テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| post_code   | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city_suburb | string     | null: false                    |
| address_1   | string     | null: false                    |
| address_2   | string     |                                |
| telephone   | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

#### Association

- belongs_to :user



### comments テーブル(追加実装用)

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :product