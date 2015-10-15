class Customer < ActiveRecord::Base
  has_and_belongs_to_many :categories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :picture,
  styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :picture,
  content_type: /\Aimage\/.*\z/

  #validates :first_name, presence: true
  #validates :family_name, presence: true
  #validates :birth_year, presence: true
  #validates :gender, presence: true
  #validates :base_location, presence: true
  #validates :category_ids, presence: true
end
