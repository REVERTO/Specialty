class AddLocalIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :local_id, :integer
  end
end
