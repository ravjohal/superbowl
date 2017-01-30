class AddSuperBowlIdToAnswers < ActiveRecord::Migration[5.0]
  def change
    add_column :answers, :super_bowl_id, :integer
  end
end
