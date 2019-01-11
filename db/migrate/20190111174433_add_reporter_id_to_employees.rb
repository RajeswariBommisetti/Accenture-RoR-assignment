class AddReporterIdToEmployees < ActiveRecord::Migration[5.2]
  def change
  	add_column :employees, :reporter_id, :integer, index: true
  end
end
