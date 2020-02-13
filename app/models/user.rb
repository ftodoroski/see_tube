
class User < ApplicationRecord
    has_secure_password

    has_many :comments
	has_many :likes
	has_many :videos
    has_many :playlists
    
    validates :name, :username, :password, :email, presence: true
    validates :username, :email, uniqueness: true
    validates :password, length: { minimum: 8 }
    validate :valid_password
    validate :valid_email
    validate :valid_username
    validate :valid_name

    def valid_name
        input = name
        if /[^A-Za-z ]/.match?(input)
            errors.add(:name, "contains an non-letter")
        end

        if input.count(" ") > 1
            errors.add(:name, "contains too many spaces")
        end

        if input.count(" ") > 1 && /[^A-Za-z ]/.match?(input)
            return true
        end
    end

    def valid_username
        input = username

        if /[^A-Za-z0-9]/.match?(input)
            errors.add(:username, "contains an non-letter or non-number")
        end

        if input.length < 4 || input.length > 16
            errors.add(:username, "not inbetween 4-16 characters")
        end

        if input.length < 17 && input.length > 3 && !(/[^A-Za-z0-9]/.match?(input))
            return true
        end
    end

    def valid_email
        input = email
        if !(/@/.match?(input))
            errors.add(:email, "does not have an @ symbol")
        end

        if input[-4..-1] != ".com" || 4 > input.length
            errors.add(:email, "does not end in .com")
        end

        if input[0] == "@"
            errors.add(:email, "does not contain anything before the @ symbol")
        end

        if input[-5] == "@" && input[-4..-1] == ".com"
            errors.add(:email, "does not contain anything inbetween the @ symbol & the .com")
        end

        if input.count("@") > 1
            errors.add(:email, "too many @ symbols")
        end

        if input.count("@") == 1
            if input.split("@")[1].count(".") > 1
                errors.add(:email, "too many periods after the @ symbol")
            end
        end

        if input.count("@") == 1 && input.split("@")[1].count(".") == 1 && input.length >= 7 && input[-4..-1] == ".com" && input[-5] != "@"
            return true            
        end

    end

    def valid_password #Validates password
        input = password
        if !(/[A-Z]/.match?(input))
            errors.add(:password, "does not have a capital letter")
        end

        if !(/[0-9]/.match?(input))
            errors.add(:password, "does not have a number")
        end

        if /[A-Z]/.match?(input) && /[0-9]/.match?(input) && consecutive_nums(input)
            return true
        end
        return false
    end

    def consecutive_nums(input) #Helper function for determining if there are consecutive numbers
        input = input.gsub(/[^0-9]/, "") #Strips all non-numbers
        if input.length < 5 #Can't have atleast 5 consecutive numbers if there aren't even 5 numbers
            return true 
        end

        (4...input.length).each{|index|
            if input[index].to_i == input[index - 1].to_i && input[index - 1].to_i == input[index - 2].to_i && input[index - 2].to_i == input[index - 3].to_i && input[index - 3].to_i == input[index-4].to_i
                errors.add(:password, "must not contain 5 same number in a row")
                return false #returns false if there are 5 numbers that are the same in a row
            end
            if input[index].to_i - 1 == input[index - 1].to_i && input[index - 1].to_i - 1 == input[index - 2].to_i && input[index - 2].to_i - 1 == input[index - 3].to_i && input[index - 3].to_i - 1 == input[index-4].to_i
                errors.add(:password, "must not contain 5 consecutive numbers in a row")
                return false #returns false if there are 5 same consecutive numbers
            end
        }
        return true # returns true if all checks
    end
end
