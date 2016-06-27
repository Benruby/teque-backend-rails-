class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :answer_body, :created_at

  has_one :user
end
