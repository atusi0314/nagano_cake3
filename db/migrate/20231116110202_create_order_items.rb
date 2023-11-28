class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.integer :parchase_price, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
