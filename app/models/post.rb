class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validate :non_clickbait?

  private
  def non_clickbait?
    return false if self.title == nil

    if !self.title.include?("Won't Believe" || "Secret" || "Top " || "Guess")

       errors.add(:title, "Not clickbaity enough")
    end
  end
end


#Finally, add a custom validator to Post that ensures the title is sufficiently
#clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top
#[number]", or "Guess", the validator should return false.
