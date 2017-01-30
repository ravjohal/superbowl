class CreateSuperBowls < ActiveRecord::Migration[5.0]
  def change
    create_table :super_bowls do |t|
      t.string :name
      t.integer :year
      t.integer :number

      t.timestamps
    end
  end
end
