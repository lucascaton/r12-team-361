class Video < ActiveRecord::Base
  attr_accessible :description, :sponsored, :title, :youtube_url
end