# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| password           | string | null: false              |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| family_name        | string | null: false              |
| first_name_kana    | string | null: false              |
| family_name_kana   | string | null: false              |
| birth              | date   | null: false              |

### Association

- has_many :items,dependent: :destroy
- has_many :purchase_records

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| price              | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| sender_id          | integer    | null: false                    |
| shippedd_date_id   | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record

## addresses テーブル

| Column       | Type       | Options                        |
| ---------    | ---------- | ------------------------------ |
| zipcode      | string     | null: false                    |
| state_id     | integer    | null: false                    |
| city         | string     | null: false                    |
| addres1      | string     | null: false                    |
| address2     | string     |                                |
| phone_Number | integer    | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record

## purchase_records テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| buyer  | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :address