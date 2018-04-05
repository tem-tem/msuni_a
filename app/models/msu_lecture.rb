class MsuLecture < ApplicationRecord
  belongs_to :msu_discipline
  has_many :msu_images, dependent: delete_all
  validates :title, presence: { message: 'Название не может быть пустым'},
            uniqueness: {
                case_sensitive: false,
                message: "Уже существует"
            }
  validates :msu_discipline_id, presence: {message: 'Как ты умудрился потерять
  дисциплину?' }
end
