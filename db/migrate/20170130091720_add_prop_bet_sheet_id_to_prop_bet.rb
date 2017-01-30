class AddPropBetSheetIdToPropBet < ActiveRecord::Migration[5.0]
  def change
    add_column :prop_bets, :prop_bet_sheet_id, :integer
  end
end
