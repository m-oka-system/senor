class RemoveImageToCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :image, :string
  end
end
