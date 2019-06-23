class CreateAnswerChoices < ActiveRecord::Migration[5.2]
  def change
    create_table :answer_choices do |t|
      t.text :choice, null: false
      t.integer :question_id, null: false

      t.timestamps
    end

    add_foreign_key :answer_choices, :questions
    add_index :answer_choices, :question_id, unique: false
  end
end
