# frozen_string_literal: true

Node = Struct.new(:value, :next)
# created a linked list between nodes
class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if @head.nil?
      @head = Node.new(value)
    else
      temp = @head
      temp = temp.next until temp.next.nil?
      temp.next = Node.new(value)
    end
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end
  
end
my_linked_list = LinkedList.new
my_linked_list.append('some_value')
my_linked_list.prepend('some_value')
