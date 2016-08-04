module Api
	class ContactsController < ApplicationController

		def create

			contact = Contact.create(contact_params)
			contact.notify_admin
			render json: {}, root: false

		end

		private

		def contact_params
			params.require(:contact).permit(:body, :reason)
		end

	end
end