class Sale < ActiveRecord::Base
  belongs_to :category
  belongs_to :shop
  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  scope :active_sales, -> { where('ending > ?', Time.now) }

end

