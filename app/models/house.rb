class House < ApplicationRecord
  belongs_to :user
  has_many :provides
  has_many :services, :through => :provides
  has_many_attached :photos

  accepts_nested_attributes_for :provides, allow_destroy: true
end
