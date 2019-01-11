FactoryBot.define do
  factory :role do
    trait :CEO do
      title { 'CEO' }
    end

    trait :VP do
      title { 'VP' }
    end

    trait :Director do
      title { 'Director' }
    end

    trait :manager do
      title { 'manager' }
    end

    trait :SDE do
      title { 'SDE' }
    end
  end
end