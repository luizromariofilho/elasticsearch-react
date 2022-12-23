require 'csv'

class Song < ApplicationRecord
  include Filterable
  include Searchable

  scope :filter_by_title, ->(title) { where('title like ?', "#{title}%") }
  scope :filter_by_artist, ->(artist) { where('artist like ?', "#{artist}%") }

  def self.import_csv!
    filepath = "tmp/tcc_ceds_music.csv"
    res = CSV.parse(File.read(filepath), headers: true)
    res.each_with_index do |s, ind|
      Song.create!(
        artist: s["artist_name"],
        title: s["track_name"],
        genre: s["genre"],
        lyrics: s["lyrics"]
      )
    end
  end
end
