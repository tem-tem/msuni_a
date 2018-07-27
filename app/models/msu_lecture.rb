class MsuLecture < ApplicationRecord
  belongs_to :msu_discipline
  has_many :msu_images, dependent: :destroy
  has_many :msu_presentations, dependent: :destroy
  validates :title, presence: true,
            uniqueness: {
                scope: :msu_discipline_id,
                case_sensitive: false
            }
  validates :msu_discipline_id, presence: {message: 'Пропала дисциплина' }
  default_scope { order(:order) }

  def visible_lectures
    self.msu_discipline.msu_lectures.where(visible: true)
  end

  def next
    if visible_lectures.maximum("order") > self.order
      visible_lectures.select {|l| l if l.order > self.order}.map {|l| l}.first
    end
  end

  def prev
    if visible_lectures.minimum("order") < self.order
      visible_lectures.select {|l| l if l.order < self.order}.map {|l| l}.last
    end
  end
end
