require 'unit_test'

module Babycasts
  describe UserAuthentication do
    let(:access_token) do
      stub('Access Token',
           :credentials => mock(:token => 'ZZaFP3kGrz8'),
           :uid => '200000305385990',
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
    end
  end
end