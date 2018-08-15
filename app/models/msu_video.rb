class MsuVideo < ApplicationRecord
  belongs_to :msu_discipline

  validates :title, presence: true
  validates :video_id, presence: true,
            uniqueness: {scope: :msu_discipline,
                         message: "уже добавлено"}
end
