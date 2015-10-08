class Category < ActiveRecord::Base
  has_many :sales
  has_and_belongs_to_many :customers
  has_and_belongs_to_many :shops

  translates :name
end
