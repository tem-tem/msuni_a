class MsuFile < ApplicationRecord

  belongs_to :msu_discipline
  validates :name, presence: true,
            uniqueness: {scope: :msu_discipline}

  default_scope { order("created_at DESC") }

  mount_uploader :file, AttachmentUploader
end
