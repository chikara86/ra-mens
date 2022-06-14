class RemoveCloseTimeFromRamen < ActiveRecord::Migration[6.1]
  def change
    remove_column :ramen, :close_time, :time
  end
end
