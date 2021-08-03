class CreateRigs < ActiveRecord::Migration[6.1]
  def change
    create_table :rigs do |t|
      t.string :name 
      t.integer :max_depth
      t.integer :min_depth
      t.text :description
      t.integer :company_id
      t.integer :oilfield_id
      t.timestamps
    end
  end
end
