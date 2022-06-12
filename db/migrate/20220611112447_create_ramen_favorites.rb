class CreateRamenFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :ramen_favorites do |t|
      t.references :user, foreign_key: true
      t.references :ramen, foreign_key: true
      t.timestamps
    end
  end
end
