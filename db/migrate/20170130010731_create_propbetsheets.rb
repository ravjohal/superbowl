class CreatePropbetsheets < ActiveRecord::Migration[5.0]
  def change
    create_table :propbetsheets do |t|
      t.string :name
      t.boolean :paid
      t.integer :total_points

      t.timestamps
    end
  end
end
