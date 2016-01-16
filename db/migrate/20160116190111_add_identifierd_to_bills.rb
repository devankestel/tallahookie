class AddIdentifierdToBills < ActiveRecord::Migration
  def change
    add_column :bills, :identifier, :string
  end
end
