class MsuBook < ApplicationRecord
  validates :title, presence: {message: 'Название не может быть пустым'},
            uniqueness: {
                case_sensitive: false,
                message: "Уже существует"
            }
  has_many :msu_lectures, through: :msu_lecture_books
end
