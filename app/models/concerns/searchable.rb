require 'elasticsearch/model'
module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    client = Elasticsearch::Client.new(log: true, host: ENV.fetch("ELASTICSEARCH_HOST") { 'localhost' }, port: ENV.fetch("ELASTICSEARCH_PORT") { 9200 })
    Song.__elasticsearch__.client = client

    mapping do
      indexes :artist, type: :text
      indexes :title, type: :text
      indexes :lyrics, type: :text
      indexes :genre, type: :keyword
    end

    def self.search(query)
      self.__elasticsearch__.search(query)
    end
  end
end