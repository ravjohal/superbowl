class AddUserIdToPropbetsheet < ActiveRecord::Migration[5.0]
  def change
    add_column :propbetsheets, :user_id, :integer
  end
end
