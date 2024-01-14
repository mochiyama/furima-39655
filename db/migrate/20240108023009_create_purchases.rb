class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
        t.references :order,            null: false, foreign_key:true
        t.string     :zip_code,         null: false
        t.integer    :ship_from_id,     null: false
        t.string     :city,             null: false
        t.string     :street_number,    null: false
        t.string     :name_of_building
        t.string     :telephone_number, null: false
        t.timestamps
    end
  end
end