class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait

#  what if below is not capitalized?
  CLICKBAIT = ["Won't Believe", "Secret", "Top {/\d/}", "Guess"]

#  so this will throw an error (at least in learn) because it's testing a title that actually hasn't passed another validation -- how to make sure other validations pass first?

  def clickbait
    if CLICKBAIT.none? {|phrase| title.include?(phrase)} 
    errors.add(:title, "can't be clickbait")
    end
  end


end
