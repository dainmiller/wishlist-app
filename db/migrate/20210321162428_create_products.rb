class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :url
      t.integer :price
      t.boolean :purchased

      t.timestamps
    end
  end
end
