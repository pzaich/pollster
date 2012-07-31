Fabricator(:answer) do
  value {Faker::Lorem.sentence}
  question_id {1}
end