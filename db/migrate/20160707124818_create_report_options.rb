class CreateReportOptions < ActiveRecord::Migration
  def change
    create_table :report_options do |t|

    	t.string :option

      t.timestamps null: false
    end
  end
end
