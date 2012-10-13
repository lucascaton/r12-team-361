require 'spec_helper'

describe Video do
  it 'parses the Youtube URL and it saves the Youtube video ID' do
    [
      'http://youtube.com/watch?v=1234567890',
      'https://youtube.com/watch?v=1234567890',

      'http://www.youtube.com/watch?v=1234567890',
      'https://www.youtube.com/watch?v=1234567890',

      'http://youtu.be/1234567890',
      'https://youtu.be/1234567890',

      'http://www.youtu.be/1234567890',
      'https://www.youtu.be/1234567890',

      'http://www.youtube.com/watch?v=1234567890&feature=context&context=G2de15aaFAAAAAAAAAAA',

      'www.youtube.com/watch?v=1234567890',
      'youtube.com/watch?v=1234567890',
      'youtu.be/1234567890'
    ].each do |youtube_url|
      video = FactoryGirl.create(:video, youtube_url: youtube_url)
      expect(video.reload.youtube_id).to eq('1234567890')
    end
  end

  it 'whatever' do
    [
      'youtube.com',
      'youtube.com/',
      'youtube.com/watch',
      'youtube.com/watch/',
      'youtu.be',
      'youtu.be/'
    ].each do |youtube_url|
      video = FactoryGirl.build(:video, youtube_url: youtube_url)
      expect(video).to have(1).error_on(:youtube_url)
    end
  end
end
