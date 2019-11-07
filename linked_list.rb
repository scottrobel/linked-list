# frozen_string_literal: true

# a node has a value and a link
Node = Struct.new(:value, :next)
# created a linked list between nodes
class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def tail
    temp = head
    temp = temp.next until temp.next.nil?
    temp
  end

  def append(value)
    if head.nil?
      prepend(value)
    else
      tail.next = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, head)
  end

  def size
    temp = head
    size = 0
    until temp.nil?
      size += 1
      temp = temp.next
    end
    size
  end

  def at(index)
    temp = head
    index.times do
      temp = temp.next
    end
    temp
  end

  def pop
    return if head.nil?

    if head.next.nil?
      @head = nil
    else
      temp = head
      temp = temp.next until temp.next.next.nil?
      temp.next = nil
    end
  end

  def contains?(value)
    return false if head.nil?

    temp = head
    until temp.next.nil?
      return true if temp.value == value

      temp = temp.next
    end
    false
  end

  def to_s
    return 'nil' if head.nil?

    temp = head
    data_string = ''
    until temp.nil?
      data_string += "( #{temp.value} ) -> "
      temp = temp.next
    end
    data_string += 'nil'
    data_string
  end

  def insert_at(index, value)
    prepend(value) if index.zero?
    return if head.nil? || index.zero?

    prev, cur = get_prev_and_cur_nodes(index)
    prev.next = Node.new(value, cur) unless cur.nil?
  end

  def remove_at(index)
    @head = head.next if index.zero?
    return if head.nil? || index.zero?

    prev, cur = get_prev_and_cur_nodes(index)
    prev.next = cur.next unless cur.nil?
  end

  private

  def get_prev_and_cur_nodes(index)
    prev = nil
    cur = head
    index.times do
      prev = cur
      cur = cur.next
    end
    [prev, cur]
  end
end

my_linked_list = LinkedList.new
puts my_linked_list
my_linked_list.prepend(5)
puts my_linked_list
my_linked_list.append(4)
puts my_linked_list
my_linked_list.insert_at(1, 'val')
puts my_linked_list
my_linked_list.remove_at(1)
puts my_linked_list
puts my_linked_list.contains?(5)
puts my_linked_list.size
puts my_linked_list.at(1)
puts my_linked_list
my_linked_list.pop
puts my_linked_list
my_linked_list.pop
puts my_linked_list
