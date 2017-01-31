class AddTotalPointsEarnedToPropBetSheets < ActiveRecord::Migration[5.0]
  def change
    add_column :prop_bet_sheets, :total_points_earned, :integer
  end
end
