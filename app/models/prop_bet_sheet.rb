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
end
