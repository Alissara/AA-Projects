class MyQueue
  def initialize
    @store = []
  end

  def enqueue(obj)
    @store.unshift(obj)
  end

  def dequeue
    @store.pop
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack
  attr_reader :max, :min

  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    @store.pop
  end

  def push(num)
    @max ||= num
    @min ||= num
    @max = num if num > @max
    @min = num if num < @min
    @store.push(num)
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class StackQueue

  def initialize
    @enqueue_stack = MyStack.new
    @dequeue_stack = MyStack.new
  end

  def enqueue
    @enqueue_stack.push
  end

  def dequeue

    # moves into dequeue_stack
    until @enqueue_stack.empty?
      @dequeue_stack.push(@enqueue_stack.pop)
    end

    # grabs thing we are dequeueinig
    first_out = @dequeue_stack.pop

    # now put back into enqueue stack to retain line order
    until @dequeue_stack.empty?
      @enqueue_stack.push(@dequeue_stack.pop)
    end

    first_out
  end

  def peek
    # moves into dequeue_stack
    until @enqueue_stack.empty?
      @dequeue_stack.push(@enqueue_stack.pop)
    end

    # find peeked element
    peeked = @dequeue_stack.peek

    # now put back into enqueue stack to retain line order
    until @dequeue_stack.empty?
      @enqueue_stack.push(@dequeue_stack.pop)
    end
  end

  def size
    @enqueue.size
  end

  def empty?
    @enqueue.empty?
  end
end
