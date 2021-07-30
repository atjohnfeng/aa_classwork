def first_anagram?(str1, str2)
  anagrams = str1.split('').permutation.to_a #n!
  anagrams.include?(str2.split(''))
end

def second_anagram?(str1, str2)
  second_word = str2.split('')
  str1.split('').each do |c|
    idx = second_word.find_index(c)
    if idx.nil?
      return false
    else
      second_word.delete_at(idx)
    end
  end
  second_word.empty?
end