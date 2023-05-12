class Service < ApplicationRecord
  has_many :houses, :through => :provides
end
