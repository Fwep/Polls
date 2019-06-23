class CreateJoinsTableResponses < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :answer_choices, table_name: :responses do |t|
      t.index :user_id
      t.index :answer_choice_id
    end
  end
end
