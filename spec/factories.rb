FactoryGirl.define do
  factory :article do
    sequence(:title)  { |n| "Title #{n}" }
    content %{ Lorem ipsum dolor sit amet, consectetur adipisicing elit, 
            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.}
    description "Lorem ipsum dolor sit amet, consectetur adipisicing elit"
    sequence(:permalink) { |n| "article-#{n}" }
    sequence(:source) { |n| "http://www.example.com/article-#{n}" }
  end
end