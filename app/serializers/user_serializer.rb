class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :authentication_token, :description, :avatar

  #has_many :questions

end
