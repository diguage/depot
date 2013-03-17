class RemoveQuantityFromLineItems < ActiveRecord::Migration
  def up
    remove_column :line_items, :quantity
  end

  def down
    add_column :line_items, :quantity, :integer
  end
end
