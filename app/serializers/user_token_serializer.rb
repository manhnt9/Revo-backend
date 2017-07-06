class UserTokenSerializer < ActiveModel::Serializer
  attributes :token
  #:role

  # def role
  #   object.user.role
  # end
end
