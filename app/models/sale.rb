class Sale < ActiveRecord::Base
  belongs_to :category
  belongs_to :shop
  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  scope :active_sales, -> { where('ending > ?', Time.now) }

  validates :terms, presence: true
  validates :starting, presence: true
  validates :ending, presence: true
  validates :category_id, presence: true
  validates :shop_id, presence: true
end

