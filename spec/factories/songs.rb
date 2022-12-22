FactoryBot.define do
  factory :song do
    title { Faker::Music::RockBand.song }
    artist { Faker::Music::RockBand.name }
    genre { Faker::Music.genre }
    lyrics { Faker::Music.album }
  end
end