class MsuImage < ApplicationRecord
  belongs_to :msu_lecture
  validates :title, presence: true,
            uniqueness: {
                message: "Уже существует"
            }
  validates :link, presence: true,
            uniqueness: {
                message: "Уже существует"
            }
  validates :msu_lecture_id, presence: { message: 'Как ты умудрился потерять
  лекцию?' }
end
