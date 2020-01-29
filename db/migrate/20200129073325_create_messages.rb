class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :header_update
      t.text :header_details
      t.string :header_first
      t.string :header_second
      t.string :header_third
      t.string :header_pot_title
      t.text :header_middle
      t.text :header_left
      t.text :footer

      t.timestamps
    end
  end
end
