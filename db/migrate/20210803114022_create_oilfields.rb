class CreateOilfields < ActiveRecord::Migration[6.1]
  def change
    create_table :oilfields do |t|
      t.string :name
      t.string :location
      t.integer :category_id
      t.timestamps
    end
  end
end
