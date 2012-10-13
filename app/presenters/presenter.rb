require 'delegate'

class Presenter < SimpleDelegator
  # This method will return a presenter for each item of collection.
  #
  #   users = UserPresenter.collect(User.all)
  #
  def self.collect(collection)
    collection.collect { |item| new(item) }
  end

  def target
    __getobj__
  end
end