FactoryBot.define do
  factory :project do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    location { Faker::Address.city }
    project_type { Project.project_types.values.sample }
    user
  end
end