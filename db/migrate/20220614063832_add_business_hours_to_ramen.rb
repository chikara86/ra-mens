class AddBusinessHoursToRamen < ActiveRecord::Migration[6.1]
  def change
    add_column :ramen, :business_hours, :string
  end
end
