class Service < ApplicationRecord
  has_many :provides
  has_many :houses, :through => :provides
end
