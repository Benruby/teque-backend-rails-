class UserAnswersSerializer < ActiveModel::Serializer
  attributes :id, :answer_body

  has_one :question
end
