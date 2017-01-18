FactoryGirl.define do
  factory :subscriber do
    name  { Faker::Address.city }
    province nil
  end

  factory :city, :class => Subscribers::City do |subscriber|
    subscriber.name
  end

  factory :municipality, :class => Subscribers::Municipality do |subscriber|
    subscriber.name
  end
end
