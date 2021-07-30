def first_anagram?(str1, str2) #n!
  anagrams = str1.split('').permutation.to_a 
  anagrams.include?(str2.split(''))
end

def second_anagram?(str1, str2) #n^2
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

def third_anagram?(str1, str2) #n log n ? n^2 ?
    first = str1.split("").sort
    second = str2.split("").sort
    first == second
end

def fourth_anagram?(str1,str2) #n
    hash1 = Hash.new(0) 
    hash2 = Hash.new(0)
    str1.each_char { |c| hash1[c] += 1 }
    str2.each_char { |c| hash2[c] += 1 }
    hash1 == hash2
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true