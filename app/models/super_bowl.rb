class SuperBowl < ApplicationRecord
	has_many :questions
	has_many :answers
	has_many :prop_bet_sheets
	has_many :prop_bets
end
