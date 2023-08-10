FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    ingredients { Faker::Food.ingredient }
    instructions { Faker::Food.description }
    tags { Faker::Hipster.words(number: 3).join(', ') }
    user

    trait :with_user do
    after(:create) do |recipe, _evaluator|
        create(:favorite, recipe: recipe, user: recipe.user)
    end
    end
  end
end
  
  