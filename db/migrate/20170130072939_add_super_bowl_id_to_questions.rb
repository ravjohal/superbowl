class AddSuperBowlIdToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :super_bowl_id, :integer
  end
end
