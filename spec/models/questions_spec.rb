describe Question do
	describe "Questions validations" do
		
		it "should have a title" do
			q = FactoryGirl.build :question, title: ""
			q.should_not be_valid
		end

		it "should have title at least 5 chars long" do
			q = FactoryGirl.build :question, title: "1234"
			q.should_not be_valid
		end

		it "should have maximum 150 chars in title" do
			text = Faker::Lorem.paragraph
			if text.length > 150
				q = FactoryGirl.build :question, title: text
				q.should_not be_valid
			else
				text = Faker::Lorem.paragraph + Faker::Lorem.paragraph + Faker::Lorem.paragraph
				q = FactoryGirl.build :question, title: text
				q.should_not be_valid
			end

		end

		it "should have maximum 250 chars in body" do
			text = Faker::Lorem.paragraph
			if text.length > 250
				q = FactoryGirl.build :question, title: text
				q.should_not be_valid
			else
				text = Faker::Lorem.paragraph + Faker::Lorem.paragraph + Faker::Lorem.paragraph
				q = FactoryGirl.build :question, title: text
				q.should_not be_valid
			end
		end

		it { should belong_to(:user) }
	end 
end