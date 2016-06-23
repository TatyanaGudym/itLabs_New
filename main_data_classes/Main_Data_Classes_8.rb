#8. There is a hash where keys and values are strings.
#Modify it: all keys should be symbols and all values should be integers.
# If you couldn't modify some value set it to nil

def is_string_a_number (str)
  /(\D+)/.match(str).nil?
end


def convert (hash)
  hash.map do |k,v|
    k = k.to_sym

    if is_string_a_number(v)
      v = v.to_i
    else
      v = nil
    end

    [k, v]
  end
end


h = {"март"=>"0", "январь"=> "first", "февраль"=> "3"}
puts convert(h).inspect








