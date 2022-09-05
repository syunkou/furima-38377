# テーブル設計

## users テーブル

| Column           | Type   | Options                  |
| ---------------- | ------ | ------------------------ |
| nickname         | string | null: false              |
| email            | string | null: false,unique: true |
| password         | string | null: false              |
| first_name       | string | null: false              |
| family_name      | string | null: false              |
| first_name_kana  | string | null: false              |
| family_name_kana | string | null: false              |
| birth            | date   | null: false              |

### Association

- has_many :items,dependent: :destroy
- has_many :address,dependent: :destroy
- has_many :purchase_records

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| price           | integer    | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| sender          | string     | null: false                    |
| shippedd_date   | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_records

## addresses テーブル

| Column       | Type       | Options                        |
| ---------    | ---------- | ------------------------------ |
| zipcode      | string     | null: false                    |
| state        | string     | null: false                    |
| city         | string     | null: false                    |
| addres1      | string     | null: false                    |
| address2     | string     | null: false                    |
| phone_Number | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| buyer_id | references | null: false, foreign_key: true |
| item_id  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address