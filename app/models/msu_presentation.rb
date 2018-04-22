class MsuPresentation < ApplicationRecord
  belongs_to :msu_lecture

  validates :title, presence: true,
            uniqueness: {
                case_sensitive: false,
                scope: :msu_lecture_id
            }
  validates :filename, presence: true,
            uniqueness: {
                case_sensitive: false
            }
end
