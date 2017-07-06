class UsersSerializer < ActiveModel::Serializer
  attributes :id, :email, :role
end
