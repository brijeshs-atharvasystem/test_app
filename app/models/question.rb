class Question < ApplicationRecord
  belongs_to :user
  has_many :question_topics
  has_many :topics, through: :question_topics
  has_many :answers

  attr_accessor :topic_names

  after_save :setup_topics

  def setup_topics
    return if topic_names.nil?
    topic_names.split(',').each do |topic_name|
      object = Topic.find_or_create_by!(name: topic_name)
      QuestionTopic.create!(question_id: self.id, topic_id: object.id)
    end
  end
end
