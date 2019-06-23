# == Schema Information
#
# Table name: polls
#
#  id      :bigint           not null, primary key
#  title   :string           not null
#  user_id :integer          not null
#

class Poll < ApplicationRecord
  belongs_to :author,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
  has_many :questions
  
  validates :title, presence: true, uniqueness: false  
end
