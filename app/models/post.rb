class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    validate :non_clickbait

    def non_clickbait
        cb = ['Won\'t Believe', 'Secret', "Guess", "Top[number]"]
        if title 
            errors[:base] << 'not clickbaity enough' unless cb.any? {|cb| title.include?(cb)}
        end
    end


end
