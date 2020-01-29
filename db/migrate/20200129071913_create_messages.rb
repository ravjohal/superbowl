class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :header_update
      t.text :header_details
      t.text :header_pot

      t.timestamps
    end
  end
end
