class CreateQuestionTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :question_topics do |t|
      t.integer :question_id
      t.integer :topic_id
      t.timestamps
    end
    add_index :question_topics, :question_id
    add_index :question_topics, :topic_id
  end
end
