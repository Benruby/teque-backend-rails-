module Requests
	module JsonHelpers
		def json
			JSON.parse(response.body)
		end

		def request_headers
			headers = {
				"Accept" => "application/json",
				"Content-Type" => "application/json",
				"token" => "somefaketoken"
			}
			
		end

		def request_headers_no_token
			headers = {
				"Accept" => "application/json",
				"Content-Type" => "application/json"
			}
			
		end

		def stub_current_user(user)
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
		end
	end
end