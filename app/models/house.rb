class House < ApplicationRecord
  belongs_to :user
  has_many :provides
  has_many :services, :through => :provides
  has_many_attached :photos
  validate :check_dates_order
  validate :check_photos_presence

  accepts_nested_attributes_for :provides, allow_destroy: true

  def check_dates_order
    if data_in.present? && data_out.present? && data_in >= data_out
      errors.add(:data_in, "deve essere precedente alla data di check out!")
    end
  end
  def check_photos_presence
    if photos.blank? || photos.size.zero?
      errors.add(:photos, "è obbligatoria almeno una foto")
    end
  end
end
