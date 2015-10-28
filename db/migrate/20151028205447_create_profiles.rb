class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.date :birthday
      t.string :work
      t.string :skills
      t.string :interests
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
