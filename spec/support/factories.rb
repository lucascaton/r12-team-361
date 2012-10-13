# encoding: utf-8
require 'factory_girl'
require 'forgery'

FactoryGirl.define do
  factory :video do
    title { Forgery::LoremIpsum.words(3) }
    description { Forgery::LoremIpsum.sentence }
    youtube_url 'http://www.youtube.com/watch?v=TTqpEJh03fI'
    sponsored false
  end
end
