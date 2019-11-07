# frozen_string_literal: true

Node = Struct.new :value, :next
# created a linked list between nodes
class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def tail
    temp = @head
    temp = temp.next until temp.next.nil?
    temp
  end

  def append(value)
    if @head.nil?
      prepend(Node.new(value))
    else
      tail.next = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    temp = @head
    size = 0
    until temp.nil?
      size += 1
      temp = temp.next
    end
    size
  end

  def at(index)
    temp = @head
    index.times do
      temp = temp.next
    end
    temp
  end

  def pop
    temp = @head
    temp = temp.next until temp.next.next.nil?
    temp.next = nil
  end
end
my_linked_list = LinkedList.new
my_linked_list.append('some_value')
my_linked_list.append('some_value')
my_linked_list.prepend('some_value')
puts my_linked_list.at(1)
