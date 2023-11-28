class AddIsDeleteToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :is_delete, :boolean
  end
end
