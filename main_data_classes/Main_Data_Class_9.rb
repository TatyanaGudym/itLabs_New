# 9. There is a hash where keys are symbols and values are integers.
# Modify it: remove all pairs where symbols start with "s" character

h = {first: 1, second: 2, third: 3}

def remove_pair (h)
  h.delete_if do |symbol, value|
    symbol.to_s.start_with?("s")
  end
end

puts remove_pair (h).inspect
