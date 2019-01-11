class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.float :salary
      t.integer :rating
      t.references :role, index: true
      t.boolean :resigned, default: false
      t.timestamps
    end
  end
end
