describe User do
	describe "#send_password_reset" do
		let(:user) {FactoryGirl.create(:user)}

		it "generates a unique password_reset_token each time" do
			user.send_password_reset
			last_token = user.reset_password_token
			user.send_password_reset
			user.reset_password_token.should_not eq(last_token)
		end

		it "saves the time the password reset token was sent" do
			user.send_password_reset
			user.reload.reset_password_sent_at.should be_present
		end

		it "delivers email to the right email" do
			user.send_password_reset
			last_email.to.should include(user.email)
		end

	end 
end