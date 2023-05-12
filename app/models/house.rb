class House < ApplicationRecord
  belongs_to :user
  has_many :services, :through => :provides
  has_many_attached :photos
end
