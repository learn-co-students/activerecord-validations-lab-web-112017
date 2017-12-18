class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless record.title != nil
      record.errors[:title] << "Must include title"
    end

    unless record.title != nil && record.title.include?("You"||"Guess"||"Won't Believe"||"Secret"||"Top")
      record.errors[:title] << 'Must be more clickbaity'
    end
  end
end


class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: ["Fiction", "Non-Fiction"]
  validates_with TitleValidator
end
