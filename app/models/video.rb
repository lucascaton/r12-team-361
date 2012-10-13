class Video < ActiveRecord::Base
  YOUTUBE_REGEX = /(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?(\w{10,})(\S*)/

  attr_accessible :title, :description, :youtube_url, :sponsored, :youtube_id

  validates :title, :description, :youtube_url, presence: true

  validate :check_youtube_url

  after_validation :parse_youtube_url

  private

  def check_youtube_url
    errors.add(:youtube_url, :invalid) unless self.youtube_url =~ YOUTUBE_REGEX
  end

  def parse_youtube_url
    update_attributes youtube_id: youtube_url.gsub(YOUTUBE_REGEX, '\1') if youtube_id.nil?
  end
end
