class LinkedList
  attr_accessor :head, :tail, :length

  def initialize
    self.length = 0
    self.head = nil
    self.tail = nil
  end

  def append value
    node = Node.new value
    self.length += 1

    if !self.head
      self.head = node
      self.tail = node
      return self.head
    end

    node.prev = self.tail
    self.tail.next = node
    self.tail = node
  end

  def prepend value
    node = Node.new value
    self.head.prev = node
    node.next = self.head
    self.head = node
  end

  def find value
    findAll(value, true)[0]
  end

  def findAll value, stopAtFirst = false
    currentNode = self.head
    results = []
    while currentNode
      if currentNode.value == value
        results.push currentNode
        stopAtFirst && break
      end
      currentNode = currentNode.next
    end

    results
  end

  def delete value
    if self.length == 0
      return raise "invalid operation \n#{self} is empty"
    end

    if self.length == 1
      if self.head.value == value
        self.head = nil
        self.tail = nil
        self.length -= 1
        return
      end
    end

    if self.tail.value == value
      self.tail.prev.next = nil
      self.tail = nil
      self.length -= 1
      return
    end

    foundNode = self.find value
    if foundNode
      foundNode.next.prev = foundNode.prev
      foundNode.prev.next = foundNode.next
      self.length -= 1
    end
  end
  
  private

  class Node
    attr_accessor :value, :next, :prev
    def initialize (value)
      self.value = value
      self.next = nil
      self.prev = nil
    end
  end
end

list = LinkedList.new
