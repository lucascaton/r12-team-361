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
    end
  end
end