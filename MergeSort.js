function sort(arr) {
  let length = arr.length,
  mid = Math.floor(arr.length/2),
  left = arr.slice(0, mid),
  right = arr.slice(mid, length)
  if (length === 1) {
    return arr;
  }

  return merge(sort(left), sort(right))
}

function merge(left, right) {
  sorted = [];

  while(left.length !== 0 && right.length !== 0) {
    if (left[0] > right[0]) {
      sorted.push(right[0]);
      right.splice(0, 1);
    } else {
      sorted.push(left[0]);
      left.splice(0, 1);
    }
  }

  while (left.length !== 0) {
    sorted.push(left[0]);
    left.splice(left.length - 1, 1);
  }

  while (right.length !== 0) {
    sorted.push(right[0]);
    right.splice(right.length - 1, 1);
  }

  return sorted;
}
sort([2, 3, 6, 1])
