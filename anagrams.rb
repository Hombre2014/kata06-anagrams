class Anagrams
  $time_start = Time.now
  puts 'Start at: ', $time_start

  def input_from_file(file_name)
    file = File.open(file_name, "r")
    array_of_words = file.readlines.map(&:chomp)
    file.close
    array_of_words
  end

  def anagrams(array_of_words)
    max_letters = 0
    longest_anagram = ''
    max_anagrams = 0
    most_anagrams = []
    # file_out = File.open("results.txt", "w+")
    result = array_of_words.group_by { |word| word.downcase.chars.sort }
    puts 'All anagrams in the wordlist:'
    result.keys.each do |key|
      values = result[key].compact
      p values if (values.size > 1)
      if max_letters < key.size && values.size > 1
        max_letters = key.size
        longest_anagram = result[key]
      end
      if max_anagrams < result[key].size
        max_anagrams = result[key].size
        most_anagrams = result[key]
      end
      # file_out.puts values if values.size > 1
    end
    # file_out.close
    puts "The anagrams with the most number of characters: #{max_letters}", longest_anagram
    puts "The most number of anagrams: #{max_anagrams} ", most_anagrams
    # result = array_of_words.group_by { |word| word.downcase.chars.sort }.values
    # result.select { |anagram| anagram.size > 1 }
    time_end = Time.now
    puts "Total run time: #{time_end - $time_start}, seconds"
  end
end

words = Anagrams.new.input_from_file("wordlist.txt")
puts all_anagrams_sorted = Anagrams.new.anagrams(words)
