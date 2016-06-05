class QuestionSerializer < AllQuestionsSerializer
  attributes :id, :title, :body, :user_id, :upvotes

  has_many :answers
end
