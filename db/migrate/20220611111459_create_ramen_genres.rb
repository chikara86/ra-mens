class CreateRamenGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :ramen_genres do |t|
      t.references :ramen, foreign_key: true
      t.references :genre, foreign_key: true

      t.timestamps
    end
  end
end
