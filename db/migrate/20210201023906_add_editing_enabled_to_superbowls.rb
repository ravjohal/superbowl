class AddEditingEnabledToSuperbowls < ActiveRecord::Migration[5.2]
  def change
    add_column :super_bowls, :editing_enabled, :boolean
  end
end
