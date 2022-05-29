class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  set_key_transform :camel_lower
  attributes :title, :location, :description, :project_type, :created_at, :updated_at

  attribute :thumbnail do |object|
    object.thumbnail.attachment.service_url
  end

  attribute :type do |object|
    object.project_type
  end

  attribute :owner_name do |object|
    object.user.name
  end

end