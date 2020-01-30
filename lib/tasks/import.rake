require 'csv'

namespace :import do

	desc "Import answers from CSV"
	task answers: :environment do
		filename = File.join Rails.root, "answers.csv"
		CSV.foreach(filename, headers: true) do |root|
			p row
		end
	end
end