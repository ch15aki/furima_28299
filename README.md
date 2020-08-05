# README

## テーブル設計



### users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

#### Association

- has_many :products
- has_many :comments
- has_many :purchases
- has_one :profile



### profiles テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| first_name         | string  | null: false |
| last_name          | string  | null: false |
| first_name_in_kana | string  | null: false |
| last_name_in_kana  | string  | null: false |
| birthday           | integer | null: false |
| user_id            | integer | null: false |

#### Association

- has_one :user



### products テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| image        | text    | null: false |
| product_name | string  | null: false |
| description  | text    | null: false |
| price        | integer | null: false |
| user_id      | integer | null: false |
| category_id  | integer | null: false |
| status_id    | integer | null: false |
| shipping_id  | integer | null: false |

#### Association

- belongs_to :user
- belongs_to :category
- belongs_to :status
- has_many :comments
- has_one :shipping



### categorys テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| category | string | null: false |

#### Association

- has_many :products



### status テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| status | string | null: false |

#### Association

- has_many :products



### shipping テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| cost          | string | null: false |
| ship_from     | string | null: false |
| shipping_date | string | null: false |

#### Association

- has_one :products



### purchases テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| user_id    |         |             |
| product_id | integer | null: false |
| payment_id | integer | null: false |
| address_id | integer | null: false |

#### Association

- belongs_to :user
- has_one :product
- has_one :payment
- has_one :address



### address テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| post_code   | string  | null: false |
| prefecture  | string  | null: false |
| city_suburb | string  | null: false |
| address_1   | string  | null: false |
| address_2   | string  |             |
| telephone   | integer | null: false |
| purchase_id | integer | null: false |

#### Association

- has_one :purchase



### payments テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| card_number   | integer | null: false |
| expiry_date   | integer | null: false |
| security_code | integer | null: false |
| purchase_id   | integer | null: false |

#### Association

- has_one :purchase



### comments テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| text       | text    | null: false |
| user_id    | integer | null: false |
| product_id | integer | null: false |

#### Association

- belongs_to :user
- belongs_to :product