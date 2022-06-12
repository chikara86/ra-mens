class CreateRamenComments < ActiveRecord::Migration[6.1]
  def change
    create_table :ramen_comments do |t|
      t.references :user, foreign_key: true
      t.references :ramen, foreign_key: true
      t.text :comment, null: false
      t.timestamps
    end
  end
end
