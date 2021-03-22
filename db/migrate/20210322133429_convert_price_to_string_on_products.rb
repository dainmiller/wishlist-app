class ConvertPriceToStringOnProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :price
    add_column :products, :price, :string
  end
end
