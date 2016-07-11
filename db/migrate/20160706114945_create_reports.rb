class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :reportable_type
      t.integer :reportable_id
      t.integer :user_id
      t.text :reason

      t.timestamps null: false
    end
  end
end
