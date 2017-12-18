class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with MyValidator

  validates :title, presence: true

  validates :content, length: { minimum: 250 }

  validates :summary, length: { maximum: 250 }

  validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid size" }

  validates_with :title, MyValidator

  # validates :size, inclusion: { in: %w(small medium large),
  #   message: "%{value} is not a valid size" }

end


class MyValidator < ActiveModel::Validator
  def validate(record)
    record.title.include? 'Won\'t Believe Secret Top [number] Guess'
  end
end
