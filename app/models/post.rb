class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}
  validate :clickbait_title

  PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def clickbait_title
    if PATTERNS.none? {|thing| thing.match title}
      errors.add(:title, "needs to include clickbait title")
    end
  end
end
