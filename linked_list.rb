Node = Struct.new(:data,:next)
class LinkedList
  def initialize
    @head = nil
  end
  def append(data)
    temp = @head
    if(@head == nil)
      @head = Node.new(data)
    else
      until(temp.next == nil) do
        temp = temp.next
      end
      temp.next = Node.new(data)
    end
  end

end
