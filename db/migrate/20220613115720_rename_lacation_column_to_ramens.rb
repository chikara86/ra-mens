class RenameLacationColumnToRamens < ActiveRecord::Migration[6.1]
  def change
    rename_column :ramen, :lacation, :location
  end
end
