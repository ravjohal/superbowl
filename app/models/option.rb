class Option < ApplicationRecord
	belongs_to :question, optional: true
	belongs_to :answer, optional: true
end
