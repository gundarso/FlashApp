class Shop < ActiveRecord::Base
  has_many :sales
  has_and_belongs_to_many :categories
# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :full_address
  after_validation :geocode, if: :street_address_changed?

  validates :name, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :postcode, presence: true
  validates :country, presence: true
  validates :phone, presence: true
  validates :contact_email, presence: true
  validates :category_ids, presence: true

  def full_address
    street_address + ' ' + postcode + ' ' + city
  end

end
