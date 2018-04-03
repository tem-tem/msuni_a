class Discipline < ApplicationRecord
  validates :name, presence: { message: 'Empty field' } ,
            uniqueness: {
                case_sensitive: false,
                message: 'Already exists'
            }
end
