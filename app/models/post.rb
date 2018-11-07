class Post < ActiveRecord::Base
validates :title, presence: true
validates :content, length: { minimum: 250 }
validates :summary, length: { maximum: 250 }
validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
validate :clickbait

    def clickbait
        if title
            bait = ["Won't Believe", "Secret", "Top","Guess"]
            
            errors.add(title, "isn't clickbaity enough") unless bait.any? {|s| title.include?(s)}
        end
    end
end