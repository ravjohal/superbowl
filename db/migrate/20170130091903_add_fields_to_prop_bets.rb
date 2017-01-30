class AddFieldsToPropBets < ActiveRecord::Migration[5.0]
  def change
    add_column :prop_bets, :user_id, :integer
    add_column :prop_bets, :super_bowl_id, :integer
  end
end
