#1. Create a method which will take a natural number as an argument and will find a sum of all its digits

def method_1 (number)
  number.to_s.split('').map(&:to_i).inject(0, :+)
end
