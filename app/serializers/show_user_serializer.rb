class ShowUserSerializer < ActiveModel::Serializer
  attributes :full_name, :description, :avatar,	:followed, :id, :follower_count

end
