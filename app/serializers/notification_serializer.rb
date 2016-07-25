class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :notifiable_type, :notifiable
end
