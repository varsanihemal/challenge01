# Using a single puts statement build the following
# sentence using only data from the carl hash and the
# sagan array along with some string interpolation.
#
# We are a way for the cosmos to know itself.

carl  = {
          :toast => 'cosmos',
          :punctuation => [ ',', '.', '?' ],
          :words => [ 'know', 'for', 'we']
        }

sagan = [
          { :are => 'are', 'A' => 'a' },
          { 'waaaaaay' => 'way', :th3 => 'the' },
          'itself',
          { 2 => ['to']}
        ]

# Here is an example of building a setence out of array/hash pieces.
example = [ 'test', 'a', 'is']
time    = { :that => 'This', :period => '.'}
puts "#{time[:that]} #{example[2]} #{example[1]} #{example[0]}#{time[:period]}"

ghosts = [
          { name: 'Inky', age: 4, loves: 'reindeers', net_worth: 25 },
          { name: 'Pinky', age: 5, loves: 'garden tools', net_worth: 14 },
          { name: 'Blinky', age: 7, loves: 'ninjas', net_worth: 18.03 },
          { name: 'Clyde', age: 6, loves: 'yarn', net_worth: 0 }
        ]

ghosts.each do |ghost|
    ghost_info  = "#{ghost[:name]} is #{ghost[:age]} years old, "
    ghost_info += "loves #{ghost[:loves]} and "
    ghost_info += "has #{ghost[:net_worth]} dollars in the bank."
    puts ghost_info
end

# part 2 DOG API
require 'net/http'
require 'json'
require 'pp'
 
url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response) # Convert JSON data into Ruby data.
pp dog_breeds # pp stands for pretty print.

# Access the hash of dog breeds and sub-breeds
dog_breeds = dog_breeds['message']

# Print out the dog breeds and sub-breeds
dog_breeds.each do |breed, sub_breeds|
  puts "* #{breed.capitalize}"
  if sub_breeds.any?
    sub_breeds.each do |sub_breed|
      puts "  * #{sub_breed.capitalize}"
    end
  end
end


require 'net/http'
require 'json'

url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json'
uri = URI(url)
response = Net::HTTP.get(uri)
trees_data = JSON.parse(response)

# Accessing the array of trees
trees = trees_data

# Initializing a counter for Ash trees
ash_tree_count = 0

# Iterating through each tree to count Ash trees
trees.each do |tree|
  if tree['common_name'] && tree['common_name'].downcase.include?('ash')
    ash_tree_count += 1
  end
end

puts "Total number of Ash trees in the city: #{ash_tree_count}"
