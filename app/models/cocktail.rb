require 'uri'

class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true
  validates :image_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), presence: true
end
