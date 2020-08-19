# README

## テーブル設計



### users テーブル

| Column                    | Type   | Options     |
| ------------------------- | ------ | ----------- |
| nickname                  | string | null: false |
| email                     | string | null: false |
| password (min_length:6)   | string | null: false |
| first_name                | string | null: false |
| last_name                 | string | null: false |
| first_name_reading (kana) | string | null: false |
| last_name_reading (kana)  | string | null: false |
| birthday                  | date   | null: false |

#### Association

- has_many :items
- has_many :comments
- has_many :order



### items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| description      | text       | null: false                    |
| price            | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| category_id      | integer    | null: false                    |
| user (seller)    | references | null: false, foreign_key: true |

#### Association

- belongs_to :user

- has_one :order

- has_one :address

- has_many :comments

- has_one_attached :image

  

### address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city_suburb   | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| telephone     | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

#### Association

- belongs_to :item



### orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user (buyer) | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

#### Association

- belongs_to :user

- belongs_to :item

  

### comments テーブル(追加実装用)

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

#### Association

- belongs_to :user
- belongs_to :product

