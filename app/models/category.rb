class Category < ActiveRecord::Base
  has_many :sales
  has_many :customers
  has_many :shops
end
