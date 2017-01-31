class Question < ApplicationRecord
	has_many :prop_bets

	belongs_to :correct_answer, class_name: 'Answer', :foreign_key => 'correct_answer_id'

	has_many :options
	has_many :answers, through: :options

	belongs_to :super_bowl

	accepts_nested_attributes_for :options,
            :allow_destroy => true
end
