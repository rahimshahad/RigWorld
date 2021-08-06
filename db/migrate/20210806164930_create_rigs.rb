class CreateRigs < ActiveRecord::Migration[6.1]
  def change
    create_table :rigs do |t|
      t.string :name 
      t.string :type 
      t.integer :max_depth
      t.integer :min_depth 
      t.string :classification
      t.string :location
      t.integer :company_id
      t.timestamps
    end
  end
end
