class MsuDiscipline < ApplicationRecord
  validates :title, presence: true,
            uniqueness: {
                case_sensitive: false
            }
  has_many :msu_lectures, dependent: :delete_all
end
