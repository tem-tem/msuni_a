class MsuPresentation < ApplicationRecord
  belongs_to :msu_lecture

  validates :pdf_filename, presence: true,
            uniqueness: true

  validates :pptx_filename, presence: true,
            uniqueness: true
end
