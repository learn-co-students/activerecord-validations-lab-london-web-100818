class Post < ActiveRecord::Base
 
    validates :title, presence: true
    validate :clickbait
    validates :summary, length: {maximum: 250}
    validates :content, length:  {minimum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    def clickbait
        if self.title
        unless  ["Won't Believe", "Secret", "Guess"].any?{|word| self.title.include?(word)}
        self.errors[:title] << 'Think of a more click-baity title, please!'
        end
    end
    end
end
