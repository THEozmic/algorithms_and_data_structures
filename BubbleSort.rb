def swap(array, elemOne, elemTwo)
  temp = array[elemOne]
  array[elemOne] = array[elemTwo]
  array[elemTwo] = temp
  return array
end

def bubbleSort(array)
  isSorted = false
  unsortedLength = array.size - 1
  while (!isSorted)
    isSorted = true
    i = 0
    while i <= unsortedLength
      if (array[i + 1])
        if (array[i] > array[i + 1])
          array = swap(array, i, i + 1)
          isSorted = false
        end
      end
      i += 1
    end
    unsortedLength -= 1
  end
  return array
end

bubbleSort([5,4,3,2,1])
