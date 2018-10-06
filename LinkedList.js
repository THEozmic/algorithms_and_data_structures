
function LinkedList(startingValue = null) {

  function Node(value) {
    this.value = value;
    this.next = null;
    this.prev = null;
  }

  let linkedList = {
    head: null,
    length: 0,
    append: function(value) {
      this.length++;
      let node = new Node(value);

      if (!this.head) {
        this.head = node;
        return this.head;
      } else {
        let curr = this.head;

        while (curr != null) {
          if (!curr.next) {
            curr.next = node;
            node.prev = curr;
            break;
          }
          curr = curr.next;
        }
      }


      return node;
    },

    prepend: function(value) {
      let node = new Node(value);
      let prevHead = this.head;
      prevHead.prev = node;
      this.head = node;
      this.head.next = prevHead;
      this.length++;
      return this.head;
    },

    find: function(value) {
      const result = this.findAll(value, true)[0] || null;

      return result;
    },

    findAll: function(value, stopAtFirst = false) {
      let curr = this.head;
      const result = [];

      while (curr) {
        if (curr.value == value) {
          result.push(curr);
          if (stopAtFirst) break;
        }
        curr = curr.next;
      }

      return result;
    },

    deleteNode: function(value) {
      let curr = this.find(value);

      curr.next.prev = curr.prev;
      curr.prev.next = curr.next;
          
      this.length --;
    } 
  };

  if (startingValue) {
    linkedList.append(startingValue);
  }

  return linkedList;
}

list = new LinkedList();
