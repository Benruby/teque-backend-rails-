class CreateBugReports < ActiveRecord::Migration
  def change
    create_table :bug_reports do |t|

    	t.string :body
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
