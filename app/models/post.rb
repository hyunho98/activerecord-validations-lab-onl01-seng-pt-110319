class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates :non_clickbait

  def non_clickbait
    if self.title != "Won't Believe" && self.title != "Secret" && self.title != /Top \d/ && self.title != "Guess"
      errors.add(:title, "not sufficiently clickbait-y")
    end
  end
end
