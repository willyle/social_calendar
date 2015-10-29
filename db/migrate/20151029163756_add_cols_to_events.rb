class AddColsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :address_1, :string
    add_column :events, :address_2, :string
    add_column :events, :city, :string
    add_column :events, :state, :string
  end
end
