FactoryGirl.define do
  factory :movie do
    title { Faker::Book.title }

    trait :from_eighties do
      release_year { (1980..1989).to_a.sample }
    end

    trait :from_nineties do
      release_year { (1990..1999).to_a.sample }
    end

    trait :with_poor_rating do
      after(:create) do |movie|
        create_list(:review, 4, rating: 1, movie: movie )
      end
    end

    trait :with_okay_rating do
      after(:create) do |movie|
        create_list(:review, 4, rating: 3, movie: movie )
      end
    end

    trait :with_good_rating do
      after(:create) do |movie|
        create_list(:review, 4, rating: 5, movie: movie )
      end
    end
  end
end
