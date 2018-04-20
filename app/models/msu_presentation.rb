class MsuPresentation < ApplicationRecord
  belongs_to :msu_lecture

  validates :title, presence: true
end
