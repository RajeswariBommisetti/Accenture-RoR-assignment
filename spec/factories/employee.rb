FactoryBot.define do
  factory :employee do
    sequence(:name) { |n| "firstname#{n}" }
    sequence(:salary) { |n| "10000#{n}" }
    sequence(:rating) { |n| "#{n}" }
    
    trait :role_id do
      association :role
    end

    trait :reporter_id do
      association :reporter
    end

  end
end
