class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|

      t.integer :cart_item_id
      t.integer :amount

      t.timestamps
    end
  end
end