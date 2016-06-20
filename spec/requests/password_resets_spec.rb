describe "Password Reset API" do

  describe "PasswordResets" do
    it "emails existing user when requesting password reset" do

      user = FactoryGirl.create(:user)

      user_params = {
        user: {
          full_name: user.full_name,
          email: user.email,
        }
        }.to_json

        post '/api/users/password', user_params, request_headers

        expect(response.status).to eq 200
        last_email.to.should include(user.email)

      end

      it "does not email invalid user when requesting password reset" do

        user_params = {
          user: {
            email: "invalidUser@Email.com"
          }
          }.to_json

          post '/api/users/password', user_params, request_headers

          last_email.should be_nil

        end
      end

    end