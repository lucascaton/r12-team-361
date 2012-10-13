require 'spec_helper'

module Babycasts
  describe UserAuthentication do
    let(:access_token) do
      stub('Access Token',
           :credentials => mock(:token => 'ZZaFP3kGrz8'),
           :uid => '200000305385990',
           :provider => "facebook",
           :extra => {'raw_info' => {'birthday' => '12/20/1981'}},
           :info => {
            'email'      => 'john@example.com',
            'first_name' => 'John',
            'last_name'  => 'Smith',
            'nickname'   => 'john_smith'
          }
      )
    end
    let(:user) { stub }

    subject { UserAuthentication.new(access_token, user: user) }

    describe "#auth_hash" do
      its(:auth_hash) { should == access_token }
    end

    describe "#info" do
      its(:info) { should == access_token.info }
    end

    describe "#facebook_uid" do
      its(:facebook_uid) { should == access_token.uid }
    end

    describe "#user" do
      its(:user) { should == user }
    end

    describe "#save" do
      context "when user is persisted" do
        let(:user) { stub(:persisted? => true) }
        subject { UserAuthentication.new(access_token, user: user) }

        its(:save) { should be true }
      end

      context "when user isn't persisted" do
        let(:user) { User.new }
        subject { UserAuthentication.new(access_token, user: user) }
        before { subject.save }

        it "should persisted the user without errors" do
          expect(user.errors).to be_empty
          expect(user).to be_persisted
        end

        it "should save the provider" do
          expect(user.provider).to eq("facebook")
        end

        it "should save the first name" do
          expect(user.first_name).to eq("John")
        end

        it "should save the last name" do
          expect(user.last_name).to eq("Smith")
        end

        it "should save the nickname" do
          expect(user.nickname).to eq("john_smith")
        end

        it "should save the facebook token" do
          expect(user.facebook_token).to eq("ZZaFP3kGrz8")
        end

        it "should save the facebook uid" do
          expect(user.facebook_uid).to eq("200000305385990")
        end
      end
    end
  end
end