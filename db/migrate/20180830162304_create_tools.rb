class CreateTools < ActiveRecord::Migration[5.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.integer :quantity
      t.boolean :available

      t.timestamps
    end
  end
end
