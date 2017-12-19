class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :non_clickbait


  private

   def non_clickbait

     if self.title == nil
       return false
     else
       new_title = self.title.include?("Won't Believe" || "Secret" || "Top[number]" || "Guess")

       if !new_title
          errors.add(:title, "Title Not clickbait")
       end
     end

   end
end
