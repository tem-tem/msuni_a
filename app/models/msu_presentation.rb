class MsuPresentation < ApplicationRecord
  belongs_to :msu_lecture
  default_scope { order("created_at DESC") }

  mount_uploader :pdf, AttachmentUploader

end
