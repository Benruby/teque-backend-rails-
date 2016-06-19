describe "User Mailer API" do
	describe "password_reset" do
		let(:user) {FactoryGirl.create(:user) }
		let(:mail) { UserMailer.password_reset(user) }

		it "sends email to user with password reset url" do 
			mail.subject.should eq("איפוס סיסמה - Teque")
			mail.to.should eq([user.email])
			mail.from.should eq(["DoNotReply@teque.co.il"])
		end
	end
end
