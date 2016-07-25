class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :notifiable_type
      t.integer :notifiable_id
      t.integer :user_id
      t.boolean :seen, default: false

      t.timestamps null: false
    end
  end
end

