FactoryGirl.define do

	factory :answer do
		answer_body		{Faker::Lorem.paragraph} 
	end	
end