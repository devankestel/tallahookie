class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :t_id
      t.string :bill_t_id
      t.string :name
      t.string :option
      t.string :counts

      t.timestamps null: false
    end
  end
end
