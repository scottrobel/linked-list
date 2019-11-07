# frozen_string_literal: true

Node = Struct.new(:value, :next)
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
      prepend(value)
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
    return if @head.nil?

    temp = @head
    temp = temp.next until temp.next.next.nil?
    temp.next = nil
  end

  def contains?(value)
    return false if @head.nil?

    temp = @head
    until temp.next.nil?
      return true if temp.value == value

      temp = temp.next
    end
    false
  end

  def to_s
    return 'nil' if @head.nil?

    temp = @head
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

    prev = nil
    cur = @head
    index.times do
      prev = cur
      cur = cur.next
    end
    prev.next = Node.new(value, cur) unless cur.nil?
  end

  def remove_at(index)
    prepend(value) if index.zero?
    return if head.nil? || index.zero?

    prev = nil
    cur = @head
    index.times do
      prev = cur
      cur = cur.next
    end
    prev.next = cur.next unless cur.nil?
  end
end
