class Song < ApplicationRecord
  include Filterable

  scope :filter_by_title, ->(title) { where('title like ?', "#{title}%") }
  scope :filter_by_artist, ->(artist) { where('artist like ?', "#{artist}%") }
end
