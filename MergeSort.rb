def sort(list)
  len = list.size

  if len === 1
    return list
  end

  left, right = list.each_slice((len/2.0).round ).to_a

  left = sort(left)
  right = sort(right)

  return merge(left, right)

end

def merge(left, right)
  sorted = []
  while (!left.empty? && !right.empty?)
    if (left[0] > right[0])
      sorted.push(right[0])
      right.shift()
    else
      sorted.push(left[0])
      left.shift()
    end
  end

  while (!left.empty?)
    sorted.push(left[0])
    left.shift()
  end

  while (!right.empty?)
    sorted.push(right[0])
    right.shift()
  end
  sorted
end

sort([3,5,2,6,1])
