class CreateQuestionUpvotes < ActiveRecord::Migration
	def change
		create_table :question_upvotes do |t|

			t.belongs_to :user, index: true
			t.belongs_to :question, index: true

			t.timestamps null: false
		end
	end
end
