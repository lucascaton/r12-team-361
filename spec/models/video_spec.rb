require 'spec_helper'

describe Video do
  [
    'http://youtube.com/watch?v=1234567-8_9',
    'https://youtube.com/watch?v=1234567-8_9',

    'http://www.youtube.com/watch?v=1234567-8_9',
    'https://www.youtube.com/watch?v=1234567-8_9',

    'http://youtu.be/1234567-8_9',
    'https://youtu.be/1234567-8_9',

    'http://www.youtu.be/1234567-8_9',
    'https://www.youtu.be/1234567-8_9',

    'http://www.youtube.com/watch?v=1234567-8_9&feature=context&context=G2de15aaFAAAAAAAAAAA',

    'www.youtube.com/watch?v=1234567-8_9',
    'youtube.com/watch?v=1234567-8_9',
    'youtu.be/1234567-8_9'
  ].each do |youtube_url|
    it "parses the '#{youtube_url}' URL and then it saves the Youtube video ID" do
      video = FactoryGirl.create(:video, youtube_url: youtube_url)
      expect(video.reload.youtube_id).to eq('1234567-8_9')
    end
  end

  [
    'youtube.com',
    'youtube.com/',
    'youtube.com/watch',
    'youtube.com/watch/',
    'youtu.be',
    'youtu.be/'
  ].each do |youtube_url|
    it "tries to parse the '#{youtube_url}' URL and then it fails" do
      video = FactoryGirl.build(:video, youtube_url: youtube_url)
      expect(video).to have(1).error_on(:youtube_url)
    end
  end
end
