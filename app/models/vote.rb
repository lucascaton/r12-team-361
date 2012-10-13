class Vote < ActiveRecord::Base
  attr_accessible :like, :user, :video

  belongs_to :user
  belongs_to :video
end
