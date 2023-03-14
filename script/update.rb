#!/usr/bin/env ruby
var = 1
coalition = ''
rankfile = 'data/rank_with_coalitions.txt'
File.write('data/rank.tmp', File.read('data/rank_without_coalitions.txt').reverse.slice(3..-1).reverse)

File.open(rankfile, 'w') do |f|
  f.truncate(0)
  while var < 203
    # Print a message to confirm that the loop is being executed
    login1337 = File.readlines('data/rank.tmp').map { |line| line.split(' ')[1] }[var - 1]
    rank = File.readlines('data/rank.tmp').map { |line| line.split(' ')[0] }[var]
    level = File.readlines('data/rank.tmp').map { |line| line.split(' ')[2] }[var - 1]
    # Read the file and search for the line that contains the login
    line = File.readlines('data/coalitions.txt').find { |line| line.include?(login1337) }
    #line = File.readlines('data/coalitions.txt').find { |line| line&.include?(login1337) }
    if line
      coalition = line.split("'coalition': ")[1][1..-4]
    else
      coalition = ''
    end

    # Write to the file
    #f.write File.readlines(rankfile)[var - 1].chomp + coalition
    f.puts "#{rank} #{login1337} #{level} #{coalition}"
    var += 1
  end
end
#File.write(rankfile, File.readlines(rankfile)[1..-1])

var = 1
vartmp = 1
varlogin = 2

File.open('data/format_final.json', 'w') do |f|
  f.truncate(0)
end
while var < 203
  login = File.readlines(rankfile).map { |line| line.split(' ')[1] }[var - 1]
  level = File.readlines(rankfile).map { |line| line.split(' ')[2] }[var - 1]
  line = File.readlines('data/coalitions.txt').find { |line| line.include?(login) }
  # Extract the coalition from the line if it was found
  if line
    coalition = line.split("'coalition': ")[1][1..-4]
  end
  json_fmt = '"%s": [{"login": "%s", "level": "%s", "coalition": "%s"}], '
  #var += 1
  vartmp += 1
  varlogin += 1
  File.open('data/format_final.json', 'a') do |f|
    f.printf(json_fmt, var, login, level, coalition)
  var += 1
  end
end
# Read the contents of the file 'file.txt'
contents = File.open("data/format_final.json", "r").read

# Remove the spaces from the file contents
contents = contents.gsub(" ", "")

# Write the modified contents back to 'file.txt'
File.open("data/format_final.json", "w") do |f|
  f.write(contents)
end

data_tmp = File.open("data/format_final.json", "r").read
# Create the output string
output = '"203":[{"login":"last","level":"0.00"}]}'
# Insert the contents of 'data/data-tmp.json' between the two strings
output.insert(0, "var ranksBg = {#{data_tmp}")
# Write the output string to 'data.json'
File.open("data/data.json", "w") do |f|
  f.write(output)
end
