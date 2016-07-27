class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :notifiable_type, :notifiable

  has_one :user
end
