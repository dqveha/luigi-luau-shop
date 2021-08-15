class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :content_body, presence: true, length: { in: 50..250 }
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :product_id, presence: true

  scope :newest, -> {(
    select("reviews.author, reviews.rating, reviews.updated_at, reviews.content_body").joins(:product).where("product_id = 52").order("reviews.updated_at DESC")
  )}

  scope :oldest, -> {(
    select("reviews.author, reviews.rating, reviews.updated_at, reviews.content_body").joins(:product).where("product_id = 52").order("reviews.updated_at ASC")
  )}

  before_save(:titleize_author, :capitalize_content)

  # scope :oldest, -> { where(updated_at: :asc)}

  private
    def titleize_author
      self.author = self.author.titleize
    end
    
    def capitalize_content
      self.content_body = self.content_body.capitalize
    end
end