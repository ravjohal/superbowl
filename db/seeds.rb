# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email

answers = Answer.create!([
	{name: 'Tails', super_bowl_id: 2},
	{name: 'Heads', super_bowl_id: 2},
	{name: 'New England Patriots', super_bowl_id: 2},
	{name: 'Philadelphia Eagles', super_bowl_id: 2},
	{name: 'Yes', super_bowl_id: 2},
	{name: 'No', super_bowl_id: 2},
	{name: 'Over', super_bowl_id: 2},
	{name: 'Under', super_bowl_id: 2},
	{name: 'Even', super_bowl_id: 2},
	{name: 'Odd', super_bowl_id: 2},
	{name: '1st Quarter', super_bowl_id: 2},
	{name: '2nd Quarter', super_bowl_id: 2},
	{name: '3rd Quarter', super_bowl_id: 2},
	{name: '4th Quarter', super_bowl_id: 2},
	{name: 'Patriots Touchdown', super_bowl_id: 2},
	{name: 'Patriots Field Goal', super_bowl_id: 2},
	{name: 'Patriots Safety', super_bowl_id: 2},
	{name: 'Eagles Touchdown', super_bowl_id: 2},
	{name: 'Eagles Field Goal', super_bowl_id: 2},
	{name: 'Eagles Safety', super_bowl_id: 2},
	{name: 'Fumble', super_bowl_id: 2},
	{name: 'Interception', super_bowl_id: 2},
	{name: 'No Turnover in game', super_bowl_id: 2}
	])