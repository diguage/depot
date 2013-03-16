class AddQuantityToLineLtems < ActiveRecord::Migration
  def change
    add_column :line_ltems, :quantity, :integer
  end
end
