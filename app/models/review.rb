class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :content_body, presence: true, length: { in: 50..250 }
  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :product_id, presence: true

  before_save(:titleize_author, :capitalize_content)

  private
    def titleize_author
      self.author = self.author.titleize
    end
    
    def capitalize_content
      self.content_body = self.content_body.capitalize
    end
end