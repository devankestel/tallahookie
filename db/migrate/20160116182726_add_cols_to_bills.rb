class AddColsToBills < ActiveRecord::Migration
  def change
    add_column :bills, :subject, :string
    add_column :bills, :year, :integer
    add_column :bills, :legislative_session, :string
  end
end
