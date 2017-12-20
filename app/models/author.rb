class Author < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone_number, length: { is: 10 } #what happens if i remove space; what happens if i put all validations on one line

end
