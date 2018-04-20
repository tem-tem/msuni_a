class MsuImage < ApplicationRecord
  belongs_to :msu_lecture
  validates :title, presence: true,
            uniqueness: true
  validates :link, presence: true,
            uniqueness: true
  validates :msu_lecture_id, presence: true
end
