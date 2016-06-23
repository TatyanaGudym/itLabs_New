# 3. There is a string. Find a maximal number (not a digit) in it

def find_max_number (string)
  string.gsub!(/\D/, " ").split(' ').map(&:to_i).max
end
