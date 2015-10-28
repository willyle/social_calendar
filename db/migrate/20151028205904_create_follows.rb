class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :followee_id
      t.integer :follower_id

      t.timestamps null: false
    end
  end
end
