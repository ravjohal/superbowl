class CreatePropBetSheets < ActiveRecord::Migration[5.0]
  def change
    create_table :prop_bet_sheets do |t|
      t.string :name
      t.integer :totals_points
      t.boolean :paid

      t.timestamps
    end
  end
end
