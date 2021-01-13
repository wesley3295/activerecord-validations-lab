class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"] }
    validate :non_clickbait

    CLICKBAIT = [/Won't Believe/, /Secret/, /Top [0-9]/, /Guess/]

    def non_clickbait
        
        if CLICKBAIT.none?{|click|  click.match title}

            errors.add(:title, "clickbaity")
        end
    end
end
