class Question < ApplicationRecord
	has_many :prop_bets
	#has_many :answers, through: :prop_bet_sheets

	has_many :options, class_name: 'Answer'

	belongs_to :super_bowl

	accepts_nested_attributes_for :options,
			:reject_if => :all_blank,
            :allow_destroy => true
end
