class CreateItemComments < ActiveRecord::Migration
  def change
    create_table :item_comments do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :user_id
      t.text :body

      t.timestamps null: false
    end
  end
end
