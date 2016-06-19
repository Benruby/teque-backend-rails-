FactoryGirl.define do

	factory :user do
		full_name			   {"Some User"}
		email                  {"some@email.com"}
		password               { "12345678" }     
		authentication_token   {"somefaketoken"}  
	end	
end