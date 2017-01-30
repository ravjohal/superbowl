class Answer < ApplicationRecord
	has_many :prop_bets
	#has_many :questions, through: :prop_bet_sheets
	belongs_to :super_bowl
end
