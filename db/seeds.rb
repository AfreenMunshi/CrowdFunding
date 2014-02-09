# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def time_rand from = 0.0, to = Time.now
  Time.at(from + rand * (to.to_f - from.to_f))
end

# (0..20).each{|i|
# 	User.create(name: Faker::Name.name,
# 		email: Faker::Internet.email, 
# 		#rand 10**10, 
# 		password: '123456',
		# bday: time_rand
# 		)
# } 



# Campaign.all.each{|c|
# 	user_ids = User.all.map(&:id)

# 	(0..([200,180,190].sample)).each{|o|
# 		t= c.transactions.create( amount: (300..1000).to_a.sample,
# 				user_id: user_ids.sample,
# 				verified: [true,false,true,true,true].sample,
# 				created_at: time_rand(c.created_at, c.created_at + c.days.days),
# 				ip: "%d.%d.%d.%d" % [rand(256), rand(256), rand(256), rand(256)]
# 			)
# 		puts "\n#{t.inspect}"
# 	}
# }

# Campaign.all.each{|c|
# 	amount = c.transactions.where(verified: true).inject(0) { |result, t| result + t.amount } 
# 	c.collected = amount
# 	c.save
# }