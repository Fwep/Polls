class UpdateForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :polls, :users
    remove_foreign_key :answer_choices, :questions
    remove_foreign_key :questions, :polls
    
    add_foreign_key :polls, :users, on_delete: :cascade
    add_foreign_key :answer_choices, :questions, on_delete: :cascade
    add_foreign_key :questions, :polls, on_delete: :cascade
  end
end
