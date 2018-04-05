class MsuDiscipline < ApplicationRecord
  validates :title, presence: {message: 'Название не может быть пустым'},
            uniqueness: {
                case_sensitive: false,
                message: "Уже существует"
            }
  has_many :msu_lectures, dependent: :delete_all
end
