# README

## users
| colum              | Type        | Options 1   | Options 2  |
| ------------------ | ----------  | ----------- | ---------- |
| nickname           | string      | NOT NULL    |            |
| encrypted_password | string      | NOT NULL    |            |
| email              | string      | NOT NULL    | ユニーク制約 |

### Association
belongs_to :user
has_one :sending_info


## items
| column             | Type        | Options 1   | Options 2 |
| ------------------ | ----------  | ----------- | --------- |
| image              | text        | NOT NULL    |           |
| item_name          | text        | NOT NULL    |           |
| price              | integer     | NOT NULL    |           |
| user_id            | references  | NOT NULL    | 外部キー   |
| category           | text        | NOT NULL    |           |
| condition          | text        | NOT NULL    |           |
| shipping_fee       | text        | NOT NULL    |           |
| ship_from          | text        | NOT NULL    |           |
| shipping_date      | text        | NOT NULL    |           |

### Association
belongs_to :user


## purchasing_infos
| column             | Type        | Options 1   | Options 2  |
| ------------------ | ----------  | ----------- | ---------- |
| item_id            | references  | NOT NULL    | 外部キー    |
| user_id            | references  | NOT NULL    | 外部キー     |

### Association
belongs_user
has_one :sending_info


## sending_infos
| column             | Type        | Options 1   | Options 2  |
| ------------------ | ----------  | ----------- | ---------- |
| item_id            | references  | NOT NULL    | 外部キー    |
| user_id            | references  | NOT NULL    | 外部キー    |
| shipping_address   | text        | NOT NULL    |            |

### Association
belongs_to :user