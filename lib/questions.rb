require 'rest_client'
require 'byebug'
require 'json'

# keep only the elements that start with an a
def select_elements_starting_with_a(array)
  array.select { |el| el[0]=='a'}
end

# keep only the elements that start with a vowel
def select_elements_starting_with_vowel(array)
  array.select { |el|  /^[aeiouy]/.match(el)}
end

# remove instances of nil (but NOT false) from an array
def remove_nils_from_array(array)
  array.reject { |el| el==nil}
end

# remove instances of nil AND false from an array
def remove_nils_and_false_from_array(array)
  array.reject { |el| (el==nil)||(!el)}
end

# don't reverse the array, but reverse every word inside it. e.g.
# ['dog', 'monkey'] becomes ['god', 'yeknom']
def reverse_every_element_in_array(array)
  array.select {|el| el.reverse!}
end

# given an array of student names, like ['Bob', 'Dave', 'Clive']
# give every possible pairing - in this case:
# [['Bob', 'Clive'], ['Bob', 'Dave'], ['Clive', 'Dave']]
# make sure you don't have the same pairing twice, 

#!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
def every_possible_pairing_of_students(array)
#should generte uniquew bits indexes in a nice way
  # array.permutation(2).to_a.uniq
  tab = []
  array.each do|el1|
    array.each do |el2|
      tab << [el1,el2] if (el1!=el2) && !(tab.include?([el1,el2])) && !(tab.include?([el2,el1])) 
    end
  end
  return tab
end

# discard the first 3 elements of an array, 
# e.g. [1, 2, 3, 4, 5, 6] becomes [4, 5, 6]
def all_elements_except_first_3(array)
  array[3..-1]
end

# add an element to the beginning of an array
def add_element_to_beginning_of_array(array, element)
  [element]+array
end

# sort an array of words by their last letter, e.g.
# ['sky', 'puma', 'maker'] becomes ['puma', 'maker', 'sky']
def array_sort_by_last_letter_of_word(array)
   array.sort { |x, y| x[-1] <=> y[-1] }
end

# cut strings in half, and return the first half, e.g.
# 'banana' becomes 'ban'. If the string is an odd number of letters
# round up - so 'apple' becomes 'app'
def get_first_half_of_string(string)
  string[0..(string.size/2.0-1).round]
end

# turn a positive integer into a negative integer. A negative integer
# stays negative
def make_numbers_negative(number)
  -number.abs
end

# turn an array of numbers into two arrays of numbers, one an array of 
# even numbers, the other an array of odd numbers
# even numbers come first
# so [1, 2, 3, 4, 5, 6] becomes [[2, 4, 6], [1, 3, 5]]
def separate_array_into_even_and_odd_numbers(array)
  even=[]
  odd=[]
  array.each do |el| 
    if el.even?
      even << el
    else
      odd << el
    end
  end
  [even,odd]
end

# count the numbers of elements in an element which are palindromes
# a palindrome is a word that's the same backwards as forward
# e.g. 'bob'. So in the array ['bob', 'radar', 'eat'], there
# are 2 palindromes (bob and radar), so the method should return 2
def number_of_elements_that_are_palindromes(array)
    count = 0
    array.each do |el|
      count+=1 if (el[0..(el.size/2.0-1)]==el[(el.size/2.0+1)..-1].reverse) && (!el.size.even?)
      count+=1 if (el[0..(el.size/2.0-1)]==el[(el.size/2.0)..-1].reverse) && (el.size.even?)
    end
    count
    # odd==array.select{ |el|  el[0..(el.size/2.0-1)]==el[(el.size/2.0+1)..-1].reverse}.count  
    # even=array.select{ |el|  el[0..(el.size/2.0)-1]==el[(el.size/2.0)..-1].reverse}.count
end

# return the shortest word in an array
def shortest_word_in_array(array)
  array.min_by{|el| el.size}
end

# return the shortest word in an array
def longest_word_in_array(array)
    array.max_by{|el| el.size}
end

# add up all the numbers in an array, so [1, 3, 5, 6]
# returns 15
def total_of_array(array)
  array.reduce{|sum,el| sum+=el}
end

# turn an array into itself repeated twice. So [1, 2, 3]
# becomes [1, 2, 3, 1, 2, 3]
def double_array(array)
  array + array
end

# convert a symbol into a string
def turn_symbol_into_string(symbol)
  symbol.to_s
end

# get the average from an array, rounded to the nearest integer
# so [10, 15, 25] should return 33
def average_of_array(array)
  (array.reduce{|sum,el| sum+=el}/array.count.to_f).round
end

# get all the elements in an array, up until the first element
# which is greater than five. e.g.
# [1, 3, 5, 4, 1, 2, 6, 2, 1, 3, 7]
# becomes [1, 3, 5, 4, 1, 2]
def get_elements_until_greater_than_five(array)
  index = 0 
  array.each_with_index do |el,ix|
    index = ix if el <= 5
    break if el > 5
  end
  array[0..index]
end

# turn an array (with an even number of elements) into a hash, by
# pairing up elements. e.g. ['a', 'b', 'c', 'd'] becomes
# {'a' => 'b', 'c' => 'd'}
def convert_array_to_a_hash(array)
  Hash[array.each_slice(2).to_a]
  #h = Hash[*a]
end

# get all the letters used in an array of words and return
# it as a array of letters, in alphabetical order
# . e.g. the array ['cat', 'dog', 'fish'] becomes
# ['a', 'c', 'd', 'f', 'g', 'h', 'i', 'o', 's', 't']
def get_all_letters_in_array_of_words(array)
  tab = []
  array.each do |word|
    word.each_char do |char|
      tab << char if !tab.include?(char)
    end
  end
  tab.sort
end

# swap the keys and values in a hash. e.g.
# {'a' => 'b', 'c' => 'd'} becomes
# {'b' => 'a', 'd' => 'c'}
def swap_keys_and_values_in_a_hash(hash)
  new_hash={}
  hash.each do |k,v|
    new_hash[v]=k
  end
  new_hash
end

# in a hash where the keys and values are all numbers
# add all the keys and all the values together, e.g.
# {1 => 1, 2 => 2} becomes 6
def add_together_keys_and_values(hash)
  hash.reduce(0){ |sum,(k,v)| sum+= k + v }
end

# take out all the capital letters from a string
# so 'Hello JohnDoe' becomes 'ello ohnoe'
def remove_capital_letters_from_string(string)
  new_s=''
  string.each_char do |char| 
    new_s+=char if !/[A-Z]/.match(char)
  end
  new_s
end

# round up a float up and convert it to an Integer,
# so 3.214 becomes 4
def round_up_number(float)
  f = float.round
  f > float ? f : f+1
end

# round down a float up and convert it to an Integer,
# so 9.52 becomes 9
def round_down_number(float)
   f = float.round
   f > float ? f-1 : f
end

# take a date and format it like dd/mm/yyyy, so Halloween 2013
# becomes 31/10/2013
def format_date_nicely(date)
  "#{date.day}/#{date.month}/#{date.year}"
end

# get the domain name *without* the .com part, from an email address
# so alex@makersacademy.com becomes makersacademy
def get_domain_name_from_email_address(email)
  /@[\w]+./.match(email)[0][1..-2]
end

# capitalize the first letter in each word of a string, 
#  except 'a', 'and' and 'the'
# *unless* they come at the start of the start of the string, e.g.
# 'the lion the witch and the wardrobe' becomes
# 'The Lion the Witch and the Wardrobe'
def titleize_a_string(string)
  except = ['a','and','the']
  s=string.split(' ').each_with_index{|el,ix| el.capitalize! if !except.include?(el)||(ix==0)}.join(' ')
end

# return true if a string contains any special characters
# where 'special character' means anything apart from the letters
# a-z (uppercase and lower) or numbers
def check_a_string_for_special_characters(string)
  return true if /[^a-zA-z0-9]/.match(string)!=nil
  return false
end

# get the upper limit of a range. e.g. for the range 1..20, you
# should return 20
def get_upper_limit_of(range)
  range.max
end

# should return true for a 3 dot range like 1...20, false for a 
# normal 2 dot range
def is_a_3_dot_range?(range)
  !(range.end == range.max)
end

# get the square root of a number
def square_root_of(number)
  Math.sqrt(number)
end

# count the number of words in a file
def word_count_a_file(file_path)
  count = 0 
  File.open(file_path) do |file|
    file.each do |line|
      count += line.split(' ').count
    end
  end
  count
end

# --- tougher ones ---

# call an arbitrary method from a string. so if I
# called call_method_from_string('foobar')
# the method foobar should be invoked
def call_method_from_string(str_method)
  eval(str_method)
end

# return true if the date is a uk bank holiday for 2014
# the list of bank holidays is here:
# https://www.gov.uk/bank-holidays
def is_a_2014_bank_holiday?(date)
  my_date = date.strftime("%Y-%m-%d")
  url = 'https://www.gov.uk/bank-holidays.json'
  response = RestClient.get(url)
  data=response.body
  result = JSON.parse(data)
  result['england-and-wales']['events'].each do |event|
    return true if event['date'] == my_date
  end
  return false 
end

# given your birthday this year, this method tells you
# the next year when your birthday will fall on a friday
# e.g. january 1st, will next be a friday in 2016
# return the day as a capitalized string like 'Friday'
def your_birthday_is_on_a_friday_in_the_year(birthday)
  year,month,day = birthday.year,birthday.month,birthday.day
  while true do
    year += 1
    return year if Time.new(year,month,day).friday?
  end
end

# in a file, total the number of times words of different lengths
# appear. So in a file with the text "the cat sat on the blue mat"
# I have 5 words which are 3 letters long, 1 which is 2 letters long
# and 1 that is 4 letters long. Return it as a hash in the format
# word_length => count, e.g. {2 => 1, 3 => 5, 4 => 1}
def count_words_of_each_length_in_a_file(file_path)
 result = {} 
  File.open(file_path) do |file|
    file.each do |line|
      line.split(' ').each do |word|
        w = /\w+/.match(word)[0]
        result[w.size] += 1 if result[w.size]
        result[w.size] = 1 if !result[w.size]
      end
    end
  end
  result
end

# implement fizzbuzz without modulo, i.e. the % method
# go from 1 to 100
# (there's no RSpec test for this one)
def fizzbuzz_without_modulo(max)
  fizz = 3
  buzz = 5 
  table = []
  (1..max).each do |el|
    fizz -= 1
    buzz -= 1
    table << el if fizz!=0 && buzz!=0
    if fizz == 0
      table << 'fizz'
      fizz = 3
    end
    if buzz == 0 
      table << 'buzz' unless fizz == 3
      table[table.size-1] += 'buzz' if fizz == 3 
      buzz = 5
    end  
  end
  table 
end

# print the lyrics of the song 99 bottles of beer on the wall
# http://www.99-bottles-of-beer.net/lyrics.html
# make sure you use the singular when you have one bottle of 
# beer on the wall, and print 'no more bottles of beer on the wall'
# at the end.
# (there's no RSpec test for this one)
def ninety_nine_bottles_of_beer
end
