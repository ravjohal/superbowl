class PropBet < ApplicationRecord
  belongs_to :question, optional: true
  belongs_to :answer, optional: true
  belongs_to :prop_bet_sheet, optional: true
  belongs_to :super_bowl, optional: true
  belongs_to :user, optional: true

  accepts_nested_attributes_for :question,
			:reject_if => :all_blank,
            :allow_destroy => true


end
