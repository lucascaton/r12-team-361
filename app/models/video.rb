class Video < ActiveRecord::Base
  attr_accessible :description, :sponsored, :title, :youtube_url, :user

  has_many :votes
  belongs_to :user
end
