require 'spec_helper'

module Babycasts
  describe VideoSearch do
    describe "#expected_search" do
      it "should assign the expected_search attribute" do
        expect(VideoSearch.new(expected_search: "Diapers").expected_search).to eql "Diapers"
      end

      it "should not raise if pass an attribute that don't exist" do
        expect { VideoSearch.new(foo: :bar) }.to_not raise_error
      end
    end

    describe "#results" do
      context "when the user type nothing in the search" do
        let(:video_search) { VideoSearch.new }

        it "should return all the results" do
          video = FactoryGirl.create(:video)
          expect(video_search.results).to eq [video]
        end
      end

      context "when the user type the title to search" do
        %w(Preparing To Bring Baby Home preparing to bring baby home).each do |title|
          it "should return the video that contains that title '#{title}'" do
            video        = FactoryGirl.create(:video, title: "Preparing To Bring Baby Home")
            second_video = FactoryGirl.create(:video, title: "Nice diaper")
            third_video  = FactoryGirl.create(:video, title: "Diaper Pampers")
            expect(VideoSearch.new(expected_search: title).results).to eq [video]
          end
        end
      end
    end
  end
end