module Babycasts
  class UserAuthentication
    attr_reader :auth_hash, :info, :facebook_uid, :user

    def initialize(auth_hash, options)
      @auth_hash      = auth_hash
      @info           = auth_hash.info
      @facebook_uid   = auth_hash.uid
      @facebook_token = auth_hash.credentials.token

      @user = options.fetch(:user)
    end

    def save
      return true if @user.persisted?

      @user.tap do |user|
        user.facebook_uid   = @facebook_uid
        user.facebook_token = @facebook_token
        user.provider       = @auth_hash.provider
        user.email          = info['email']
        user.first_name     = info['first_name']
        user.last_name      = info['last_name']
        user.nickname       = info['nickname']
        user.password       = Devise.friendly_token[0, 20]
      end

      return @user.save
    end
  end
end