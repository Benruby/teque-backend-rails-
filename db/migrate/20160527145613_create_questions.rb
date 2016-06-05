class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.integer :upvotes, default: 0

      t.timestamps null: false
    end
  end
end
