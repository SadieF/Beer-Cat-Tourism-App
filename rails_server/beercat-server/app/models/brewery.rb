class Brewery < ApplicationRecord
  scope :by_longitude, -> (min, max) { min && max ? where('longitude >= :min AND longitude <= :max', min: min, max: max) : all }
  scope :by_latitude, -> (min, max) { min && max ? where('latitude >= :min AND latitude <= :max', min: min, max: max) : all }

  has_many :tour_breweries
  has_many :tours, through: :tour_breweries

  API_RESULTS_LIMIT = 100

  def self.search(min_lat:, max_lat:, min_lng:, max_lng:)
    by_latitude(49, 50).
      by_longitude(-122, -124).
      limit(API_RESULTS_LIMIT)
  end
end
