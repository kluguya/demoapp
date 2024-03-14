FactoryBot.define do
  factory :eventgroup do
    name { Faker::Lorem.unique.word.gsub(/\W/, '').gsub("\u0000", '') }
  end
end