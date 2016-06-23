# 2. There is a string. Find a maximum number of digits placed in a row in it

def find_max (string)
  string.gsub!(/\D/, " ").split(' ').max_by { |x| x.length }.to_s.length
end

