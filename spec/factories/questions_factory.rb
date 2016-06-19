FactoryGirl.define do

	factory :question do
		title		 {Faker::Lorem.sentence} 
		body		 {Faker::Lorem.sentence} 
		user_id		 "1"
		upvotes 	 "0" 
	end	
end