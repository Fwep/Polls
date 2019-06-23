# == Schema Information
#
# Table name: responses
#
#  user_id          :bigint           not null
#  answer_choice_id :bigint           not null
#

class Response < ApplicationRecord
  belongs_to :answer_choice

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question
  
  validate :does_not_respond_to_own_poll, unless: -> { answer_choice.nil? }
  validate :not_duplicate_response, unless: -> { answer_choice.nil? }

  def sibling_responses
    sib_responses = self
      .question
      .responses
      .where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses
      .exists?(user_id: self.respondent.id)
  end

  private
  def not_duplicate_response
    if respondent_already_answered?
      errors[:base] << 'User has already made a response'
    end
  end

  def does_not_respond_to_own_poll
    poll_author = self
      .answer_choice
      .question
      .poll
      .author

    if poll_author.id == self.user_id
      errors[:base] << 'Cannot respond to own poll'
    end
  end
end
