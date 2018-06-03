class MsuLecture < ApplicationRecord
  belongs_to :msu_discipline
  has_many :msu_images, dependent: :destroy
  has_many :msu_presentations, dependent: :destroy
  validates :title, presence: true,
            uniqueness: {
                scope: :msu_discipline_id,
                case_sensitive: false
            }
  validates :msu_discipline_id, presence: {message: 'Пропала дисциплина' }
end
