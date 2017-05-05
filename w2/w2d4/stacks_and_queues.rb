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

  def enqueue(val)
    @enqueue_stack.push(val)
  end

  def dequeue

    # moves into dequeue_stack
    if @dequeue_stack.empty?
      @dequeue_stack.push(@enqueue_stack.pop) until @enqueue_stack.empty?
    end

    @dequeue_stack.pop
  end

  def size
    @enqueue_stack.size + @dequeue_stack.size
  end

  def empty?
    @enqueue_stack.empty? && @dequeue_stack.empty?
  end
end
