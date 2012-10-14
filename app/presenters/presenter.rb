require 'delegate'
require 'active_support/core_ext/object'

class Presenter < SimpleDelegator
  include Rails.application.routes.url_helpers
  delegate :render, :image_tag, :link_to, :content_tag, to: :helpers

  # This method will return a presenter for each item of collection.
  #
  #   users = UserPresenter.collect(User.all)
  #
  def self.collect(collection)
    collection.collect { |item| new(item) }
  end

  # Returns the target object that was initialized.
  #
  # Presenter.new(nil).target => nil
  # Presenter.new(User.new).target => <#User>
  #
  def target
    __getobj__
  end

  # This method is to use all the helpers methods available on the view
  #
  # helper.render 'videos/new'
  # helper.link_to "A Link", routes.video_path
  #
  def helpers
    ApplicationController.helpers
  end
  alias_method :h, :helpers
end

ApplicationController.helpers.view_paths.unshift("app/views")