class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.string :title, null: false
      t.integer :user_id, null: false
    end

    add_foreign_key :polls, :users
    change_column_null :users, :username, false
  end
end
