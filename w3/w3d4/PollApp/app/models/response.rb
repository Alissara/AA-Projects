# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ActiveRecord::Base
  validates :user_id, :answer_choice_id, presence: true
  validate :not_answered_more_than_once

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self
      .question
      .responses
      .where
      .not(id: self.id)
  end

  def respondent_already_answered?
    self
      .sibling_responses
      .exists?(:user_id => self.user_id)
  end

  def not_answered_more_than_once
    if respondent_already_answered?
      self.errors[:base] << "Can't answer the same question twice."
    end
  end
end
