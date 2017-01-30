class AddFieldsToPropBetSheets < ActiveRecord::Migration[5.0]
  def change
    add_column :prop_bet_sheets, :user_id, :integer
    add_column :prop_bet_sheets, :super_bowl_id, :integer
  end
end
