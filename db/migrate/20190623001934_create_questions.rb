class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question, null: false
      t.integer :poll_id, null: false
    end

    add_foreign_key :questions, :polls
    add_index :questions, :poll_id, unique: false
  end
end
