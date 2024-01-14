class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
#当modelは削除する
      t.timestamps
    end
  end
end
