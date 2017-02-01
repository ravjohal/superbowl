class PropBetSheet < ApplicationRecord
	belongs_to :user
	belongs_to :super_bowl
	# has_many :questions
	# belongs_to :answer

	has_many :prop_bets

	accepts_nested_attributes_for :prop_bets,
			:reject_if => :all_blank,
            :allow_destroy => true
    
    validates_presence_of :name

    def total_points_calculated
    	total_points = 0
    	self.prop_bets.each do |prop_bet|
    		total_points += prop_bet.question.weight
    	end
    	total_points
    end

    def total_earned_calculated
    	total_points = 0
    	self.prop_bets.each do |prop_bet|
    		if prop_bet.answer == prop_bet.question.correct_answer
    			total_points += prop_bet.question.weight
    		end
    	end
    	total_points
    end

    def self.sorted_by_total_earned
      PropBetSheet.all.sort_by(&:total_earned_calculated).reverse
    end
end
