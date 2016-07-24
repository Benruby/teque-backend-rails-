class CreateFollowers < ActiveRecord::Migration
	def change
		create_table :followers do |t|
			t.string :followable_type
			t.integer :followable_id
			t.integer :user_id
			t.timestamps null: false
		end
	end
end
