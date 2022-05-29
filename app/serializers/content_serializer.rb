class ContentSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  attributes :title, :body, :created_at, :updated_at

  attribute :project_id do |object|
    object.project.id
  end

  attribute :project_owner_name do |object|
    object.project.user.name
  end

end