Fabricator(:project) do
  title { Faker::Lorem.sentence }
  user_id  { Fabricate(:user) }
end