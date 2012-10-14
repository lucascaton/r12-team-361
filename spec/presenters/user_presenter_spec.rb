require 'spec_helper'

describe UserPresenter do
  describe "#full_name" do
    subject { UserPresenter.new(User.new(first_name: "Lucas", last_name: "Caton")) }

    its(:full_name) { should == "Lucas Caton" }
  end

  describe "#facebook_avatar" do
    let(:user) { stub(:facebook_uid => 90192) }
    let(:user_presenter) { UserPresenter.new(user) }

    it "should put a image with facebook avatar uri" do
      expect(user_presenter.facebook_avatar).to eql %{<img alt="Facebook avatar" src="http://graph.facebook.com/90192/picture?type=square" />}
    end
  end
end