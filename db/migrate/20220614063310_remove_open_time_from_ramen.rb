class RemoveOpenTimeFromRamen < ActiveRecord::Migration[6.1]
  def change
    remove_column :ramen, :open_time, :time
  end
end
