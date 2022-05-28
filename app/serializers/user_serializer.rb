class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :token, :name, :email, :country, :created_at, :updated_at
end