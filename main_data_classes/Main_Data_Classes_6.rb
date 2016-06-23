# 6. There is an array of integers (ary). Puts the index of the last element where ary[0]<ary[i]<ary[-1]

def method_6 (ary)
  last = ary.select {|i| i > ary[0] && i < ary[-1]}.last
  ary.rindex(last)
end

