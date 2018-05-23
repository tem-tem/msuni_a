class MsuImage < ApplicationRecord
  belongs_to :msu_lecture
  validates :title, presence: true,
            uniqueness: {scope: :msu_lecture}

  default_scope { order("created_at DESC") }

  mount_uploader :image, AttachmentUploader
end
