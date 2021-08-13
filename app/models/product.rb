class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  
  validates :name, presence: true
  validates :cost, presence: true, numericality: {greater_than: 0}
  validates :country_of_origin, presence: true

  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, products.country_of_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}

  scope :recent_three, -> { order(created_at: :desc).limit(3)}
  
  scope :made_in_us, -> { where("lower(country_of_origin) = ?", "US")}
  
  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
      self.country_of_origin = self.country_of_origin.upcase
    end
  end