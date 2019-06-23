class AddTimeStampsToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :created_at, :datetime, null: false, default: Time.zone.now
    add_column :questions, :updated_at, :datetime, null: false, default: Time.zone.now
  end
end
