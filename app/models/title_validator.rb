class TitleValidator < ActiveModel::Validator

    def validate(record)
        array = ["Won't Believe", "Secret", "Top[number]", "Guess"]
        if record.title != nil
            if !array.any?{|a| record.title.include?(a)}
                record.errors[:base] << "Not clickbate fs"
            end
        end
    end

end