class CreateRamen < ActiveRecord::Migration[6.1]
  def change
    create_table :ramen do |t|
      t.references :user, foreign_key: true
      t.references :genre, foreign_key: true
      t.references :area, foreign_key: true
      t.string :shop_name, null: false
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :price, null: false
      t.float :latitube
      t.float :longitube
      t.string :lacation
      t.time :open_time
      t.time :close_time
      t.string :regular_holiday
      t.timestamps
    end
  end
end
