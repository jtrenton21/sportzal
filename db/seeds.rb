# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Sport.create(name: 'Basketball')
Sport.create(name: 'Golf' )
Sport.create(name: 'Tennis' )
Sport.create(name: 'Squash' )
Sport.create(name: 'Workout' )
Sport.create(name: 'Running' )
Sport.create(name: 'Climbing' )







["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ].each do |available|
	Available.find_or_create_by_weekday(available)
end



# ["Morning", "Afternoon", "Evening", "Anytime" ].each do |available|
# 	Available.find_or_create_by_timeframe(available)
# end