# 5. There is an array of integers. First puts elements with even indexes and then with odd indexes

def method_5(a)
  array_even = a.values_at(* a.each_index.select {|i| i.even?})
  array_odd = a.values_at(* a.each_index.select {|i| i.odd?})
  puts array_even , array_odd
end