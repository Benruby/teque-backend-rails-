class QuestionSerializer < AllQuestionsSerializer
  attributes :id, :title, :body, :user_id, :upvotes

  has_many :answers
  has_many :question_upvotes
  has_one :user
end
