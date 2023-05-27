#!/usr/bin/env ruby

VOWELS = ['u', 'e', 'o', 'a', 'i']

def find_first_vowel(arr=[])
 arr.find_index { |c| VOWELS.include?(c) }
end

 
def pig_latin(word='')
 word.downcase!
 arr = word.split('')
 v_indx = find_first_vowel(arr)
 if v_indx
  conso = arr[...v_indx]
  rem = arr[v_indx..]
 else
  conso = arr
  rem = []
 end
 (rem + conso).join + 'ay'
end


def remove_punctuation(word='')
 punc = '!,;:?.'
 punc.include?(word[-1]) ? word.chop! : word
end


def sentence_to_pig_latin(sentence='')
 word_arr = sentence.split(' ')
 word_arr.map! { |w| pig_latin(remove_punctuation(w)) }
 word_arr[0].capitalize!
 word_arr.join(' ') + '.'
end


def display
 puts "\n>> Pig Latin Translator <<\n\n"
 puts 'Type phrases to translate after each prompt.'
 puts "Type 'quit' to exit."
 puts
end

def translator
 display
 loop do
  print 'translate: '
  ans = gets.chomp
  if ans.downcase != 'quit'
   puts sentence_to_pig_latin(ans)
   puts
  else
   exit!
  end
 end
end


translator