class MsuLecture < ApplicationRecord
  belongs_to :msu_discipline
  has_many :msu_images, dependent: :delete_all
  validates :title, presence: true,
            uniqueness: {
                scope: :msu_discipline_id,
                case_sensitive: false
            }
  validates :msu_discipline_id, presence: {message: 'Как ты умудрился потерять
  дисциплину?' }
end
