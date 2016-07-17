class ItemCommentSerializer < ActiveModel::Serializer
  attributes :id, :body

  has_many :item_comments, as: :commentable
  has_one :user
end
