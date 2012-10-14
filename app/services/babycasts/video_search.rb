module Babycasts
  class VideoSearch
    extend  ActiveModel::Naming
    extend  ActiveModel::Translation
    include ActiveModel::Validations
    include ActiveModel::Conversion

    attr_accessor :expected_search

    def initialize(options={})
      options.each do |key, value|
        send("#{key}=", value) if respond_to?("#{key}=")
      end
    end

    def results
      if expected_search.present?
        Video.available.where(Video.arel_table[:title].matches("%#{expected_search}%"))
      else
        Video.available
      end
    end

    def persisted?
      false
    end
  end
end
