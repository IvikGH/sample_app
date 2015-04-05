FactoryGirl.define do
  factory :user do
    name     "Michael Hartl"
    email    "email@host.com"
    password "foobar"
    password_confirmation "foobar"
  end
end
