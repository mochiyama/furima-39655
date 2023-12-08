# README

## users
| colum              | Type        | Options                   |
| ------------------ | ----------  | --------------------------|
| nickname           | string      | null: false               |
| encrypted_password | string      | null: false               |
| email              | string      | null: false,  unique:true |
| first_name         | string      | null: false               |
| last_name          | string      | null: false               |
| birth-day          | datetime    | null: false,              |

### Association
- has_many :items


## items
| column             | Type        | Options                         |
| ------------------ | ----------  | ------------------------------- |
| item_name          | text        | null: false                     |
| price              | integer     | null: false                     |
| user               | references  | null: false  foreign_key:true   |
| category           | text        | null: false                     |
| condition          | id          | null: false                     |
| shipping_fee       | id          | null: false                     |
| ship_from          | id          | null: false                     |
| shipping_date      | id          | null: false                     |

### Association
- belongs_to :user


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
| item               | references  | null: false  foreign_key:true  |
| user               | references  | null: false  foreign_key:true  |
| zip_code           | string      | null: false                    |
| prefecture         | string      | null: false                    |
| city               | string      | null: false                    |
| street_number      | string      | null: false                    |
| name_of_building   | string      | null: false                    |
| telephone_number   | string      | null: false                    |


### Association
- belongs_to :user