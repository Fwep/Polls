class AddIdToResponses < ActiveRecord::Migration[5.2]
  def change
    add_column :responses, :id, :primary_key
  end
end
