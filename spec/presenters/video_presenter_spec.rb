require 'spec_helper'

describe VideoPresenter do
  describe "#sponsored_mark" do
    context "when is a sponsor video" do
      let(:video) { VideoPresenter.new(stub(:sponsored? => true)) }

      it "should return the sponsored mark" do
        expect(video.sponsored_mark).to eq "<span>sponsored</span>"
      end
    end

    context "when isn't a sponsor video" do
      let(:video) { VideoPresenter.new(stub(:sponsored? => false)) }

      it "should return nothing" do
        expect(video.sponsored_mark).to be_nil
      end
    end
  end

  describe "#presentation" do
    context "when is a sponsor video" do
      let(:video) { VideoPresenter.new(stub(:sponsored? => true)) }

      it "should return the sponsored mark" do
        expect(video.presentation).to eq "video-content span9 sponsored"
      end
    end

    context "when isn't a sponsor video" do
      let(:video) { VideoPresenter.new(stub(:sponsored? => false)) }

      it "should return the video content normally without sponsored" do
        expect(video.presentation).to eq "video-content span9"
      end
    end
  end
end