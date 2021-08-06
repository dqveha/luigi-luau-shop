class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country_of_origin, count(reviews.id) as reviews_count")
    .join(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
  )}
  end

  before_save(:titleize_product)

  scope :recent_three, -> { order(created_at: :desc).limit(3)}

  scope :made_in_us, -> {"country_of_origin =?", "US"}

  private
    def titleize_product
      self.name = self.name.titleize
      self.country_of_origin = self.country_of_origin.titleize
    end
end