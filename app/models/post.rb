class TitleBaitValidator < ActiveModel::Validator

  def validate(record)
    unless record.title != nil && record.title.include?("You"||"Guess"||"Won't Believe"||"Secret"||"Top")
      record.errors[:title] << 'This title needs to get with the program'
    end
  end
end

class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_with TitleBaitValidator
end
