require 'rails_helper'

RSpec.describe "Questions API", type: :request do

	let(:user) { FactoryGirl.create(:user) }
	before(:each) do
		stub_current_user(user)
	end

	describe "api/questions" do

		it "returnes all questions" do

			FactoryGirl.create :question, title: "question title 1", body: "question body 1"
			FactoryGirl.create :question, title: "question title 2", body: "question body 2"

			get '/api/questions', {}, request_headers

			expect(response).to be_success
			questions = json
			question_titles = questions.map { |q| q["title"] }
			expect(question_titles).to match_array(["question title 1", "question title 2"])
		end

		it "DOES NOT return all questions if user IS NOT authenticated" do

			FactoryGirl.create :question, title: "question title 1", body: "question body 1"
			FactoryGirl.create :question, title: "question title 2", body: "question body 2"

			get '/api/questions', {}, request_headers_no_token

			expect(response.status).to eq 401
			expect(response.body).to eq ""
		end

		it "creates a new question" do
			question_params = {
				question: {
					title: "question title",
					body: "question body",
					user_id: "1"
				}
				}.to_json

				post '/api/questions', question_params, request_headers
				expect(response.status).to eq 201
				a = Question.first
				expect(a.title).to eq "question title"
				expect(a.body).to eq  "question body"
				expect(a.user_id).to eq 1

			end

		end
	end
