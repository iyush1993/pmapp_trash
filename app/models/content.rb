class Content < ApplicationRecord
  belongs_to :project
  validates_presence_of :title, :body
end
