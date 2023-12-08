# README

## users
| colum              | Type        | Options                   |
| ------------------ | ----------  | --------------------------|
| nickname           | string      | null: false               |
| encrypted_password | string      | null: false               |
| email              | string      | null: false,  unique:true |
| first_name_kanji   | string      | null: false               |
| last_name_kanji    | string      | null: false               |
| first_name_kana    | string      | null: false               |
| last_name_kana     | string      | null: false               |
| birth_day          | datetime    | null: false,              |

### Association
- has_many :items
- has_many :purchasing_infos


## items
| column             | Type        | Options                         |
| ------------------ | ----------  | ------------------------------- |
| item_name          | text        | null: false                     |
| price              | integer     | null: false                     |
| user               | references  | null: false  foreign_key:true   |
| category           | text        | null: false                     |
| condition_id       | integer     | null: false                     |
| shipping_fee_id    | integer     | null: false                     |
| ship_from_id       | integer     | null: false                     |
| shipping_date_id   | integer     | null: false                     |

### Association
- belongs_to :user
- has_one :purchasing_info


## purchasing_infos
| column             | Type        | Options                         |
| ------------------ | ----------  | ------------------------------- |
| item               | references  | null: false  foreign_key:true   |
| user               | references  | null: false  foreign_key:true   |

### Association
- belongs_user
- has_one :sending_info


## sending_infos
| column             | Type        | Options                        |
| ------------------ | ----------  | ------------------------------ |
| purchasing_info    | references  | null: false  foreign_key:true  |
| zip_code           | string      | null: false                    |
| ship_from          | id          | null: false                    |
| city               | string      | null: false                    |
| street_number      | string      | null: false                    |
| name_of_building   | string      |                                |
| telephone_number   | string      | null: false                    |


### Association
- belongs_to :user
- has_one :purchasing_info