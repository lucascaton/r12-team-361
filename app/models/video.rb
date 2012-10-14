class Video < ActiveRecord::Base
  YOUTUBE_REGEX = /(?:https?:\/\/)?(?:www\.)?youtu(?:\.be|be\.com)\/(?:watch\?v=)?([-_a-zA-Z0-9]{10,})\S*/

  attr_accessible :title, :description, :youtube_url, :sponsored, :youtube_id, :user

  validates :youtube_url, presence: true
  validates :title, length: { in: 3..40 }
  validates :description, length: { in: 3..140 }

  validate :check_youtube_url

  after_validation :parse_youtube_url

  has_many :votes

  belongs_to :user

  scope :available, where(sponsored: false).order('created_at DESC')
  scope :sponsored, where(sponsored: true)

  private

  def check_youtube_url
    errors.add(:youtube_url, :invalid) unless self.youtube_url =~ YOUTUBE_REGEX
  end

  def parse_youtube_url
    update_attributes youtube_id: youtube_url.gsub(YOUTUBE_REGEX, '\1') if youtube_id.nil?
  end
end
