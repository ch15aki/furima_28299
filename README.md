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

- has_many :items
- has_many :comments
- has_many :purchases



### items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| image            | text       | null: false                    |
| item_name        | string     | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| user_id (seller) | references | null: false, foreign_key: true |

#### Association

- belongs_to :user

- has_one :purchase

- has_many :comments

  

### address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city_suburb   | string     | null: false                    |
| address_1     | string     | null: false                    |
| address_2     | string     |                                |
| telephone     | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |

#### Association

- has_one :purchase



### purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id (buyer) | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |
| address_id      | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- has_one :item
- has_one :address



### comments テーブル(追加実装用)

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| text       | text       | null: false                    |
| user_id    | references | null: false, foreign_key: true |
| product_id | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :product