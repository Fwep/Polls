# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  question   :text             not null
#  poll_id    :integer          not null
#  created_at :datetime         default(Sun, 23 Jun 2019 00:28:20 UTC +00:00), not null
#  updated_at :datetime         default(Sun, 23 Jun 2019 00:28:20 UTC +00:00), not null
#

class Question < ApplicationRecord
  has_many :answer_choices
  
  belongs_to :poll

  has_many :responses,
    through: :answer_choices,
    source: :responses

  validates :question, presence: true, uniqueness: false

  def results
    
  end
end
