# 4. There are two strings. Find number of first matching chars

def find_number_of_first_matching_chars (str1, str2)
  counter = 0

  arr1 = str1.chars
  arr2 = str2.chars

  arr1.map.with_index do |item, index|
    if item != arr2[index]
      break
    end

    counter = counter + 1
  end

  counter
end
