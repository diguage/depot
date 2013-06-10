class ChangeDataTypeForPayType < ActiveRecord::Migration
  def up
    change_column :orders, :pay_type, :string
  end

  def down
    change_column :orders, :pay_type, :integer
  end
end
