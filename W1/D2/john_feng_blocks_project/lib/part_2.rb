def all_words_capitalized?(words)

    words.all? do |word|
        if word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase
            true
        else 
            false
        end
    end

end

def no_valid_url?(urls)

    urls.none? { |url| url.include?(".org") || url.include?(".com") || url.include?(".net") || url.include?(".io") }

end

require "byebug"

def any_passing_students?(students)
    students.any? do |student|
        grades = student[:grades]
        average = grades.sum / grades.length
        return true if average >= 75
    end
    false
end