class Answer < ApplicationRecord
	has_many :prop_bets
	has_many :correct_prop_bets, class_name: 'PropBet'

	has_many :options
	has_many :questions, through: :options
	
	has_many :correct_questions, class_name: 'Question', :foreign_key => 'correct_answer_id'

	belongs_to :super_bowl

	accepts_nested_attributes_for :options,
           :allow_destroy => true
    accepts_nested_attributes_for :correct_questions,
           :allow_destroy => true
end
