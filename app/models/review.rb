class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates :content_body, presence: true, length: { in: 50..250}
  validates :rating, inclusion: { in: 1..5}
  validates :product_id, presence: true

  # Unable to get before_save to work with Review class; tested on record store practice, and does not work as well for some reason.

  # before_save(:titleize_author, :capitalize_content)

  # private
  #   def titleize_author
  #     self.author = self.author.titleize
  #   end
    
  #   def capitalize_content
  #     self.content_body = self.content_body.capitalize
  #   end
end