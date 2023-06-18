class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :order_id
      t.string :receiver
      t.string :postal_code
      t.string :address
      t.integer :postage
      t.integer :payment_amount
      t.integer :payment_method

      t.timestamps
    end
  end
end
