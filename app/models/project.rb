class Project < ApplicationRecord
  has_one_attached :thumbnail
  belongs_to :user
  validates :title, presence: true
  validates :project_type, presence: true
  validates :location, presence: true
  enum project_type: { in_house: 0, external: 1, international: 2 }


end
