require 'rails_helper'

RSpec.describe "Answers API", type: :request do

	let(:user) { FactoryGirl.create(:user) }
	before(:each) do
		stub_current_user(user)
	end

	describe "GET /answers" do
		it "creates a new answer to a specific question when user is authenticated" do
			answer_params = {
				answer: {
					answer_body: "answer 1",
					question_id: "1",
					user_id: "1"
				}
				}.to_json

				post '/api/answers', answer_params, request_headers
				expect(response.status).to eq 201
				a = Answer.first
				expect(a.answer_body).to eq "answer 1"
				expect(a.question_id).to eq 1
			end
			it "DOES NOT create a new answer to a specific question when user is NOT authenticated" do
				answer_params = {
					answer: {
						answer_body: "answer 1",
						question_id: "1",
						user_id: "1"
					}
					}.to_json

					post '/api/answers', answer_params, request_headers_no_token
					expect(response.status).to eq 401
				end
			end
		end
