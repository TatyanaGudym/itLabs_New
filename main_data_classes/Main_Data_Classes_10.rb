# 10. There is a hash where keys are symbols and values are integers.
# Modify it: leave only pairs where value is natural number and more than 0

h = {first: 1, second: 2, third: 3, zero: 0, less: -5, good: 123, decimal: 5.4, decimal2: -1.2 }


def remove_pair (h)
  h.delete_if do |symbol, value|
    value <= 0 || value % 1 != 0
  end
end


puts remove_pair(h).inspect
