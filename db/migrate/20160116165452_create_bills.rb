class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :t_id
      t.string :title
      t.string :vote_id

      t.timestamps null: false
    end
  end
end
