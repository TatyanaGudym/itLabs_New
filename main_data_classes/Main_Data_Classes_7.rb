#7. There is an array of integers (ary).
# Modify it with adding ary[0] (first element of the array) to each even number.
# Don't do it for first and last elements

def method_7(ary)
  ary[1...-1].map{|x| x + ary[0] if x.even?}.compact!
end


