class CreateQuestionComments < ActiveRecord::Migration
  def change
    create_table :question_comments do |t|

    	t.belongs_to :user, index: true
    	t.belongs_to :question, index: true
    	t.string :comment_body

      t.timestamps null: false
    end
  end
end
