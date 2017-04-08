require 'byebug'
class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new('head')
    @tail = Link.new('tail')
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    first == @tail && last == @head
  end

  def get(key)
    search_node = @head
    until search_node.key == "tail"
      return search_node.val if search_node.key == key
      search_node = search_node.next
    end
    nil
  end

  def include?(key)
    search_node = @head
    until search_node.key == "tail"
      return true if search_node.key == key
      search_node = search_node.next
    end
    false
  end

  def append(key, val)
    new_node = Link.new(key, val)
    last.next = new_node
    new_node.prev = last
    @tail.prev = new_node
    new_node.next = @tail
  end

  def update(key, val)
    search_node = first
    until search_node.key == "tail"
      if search_node.key == key
        search_node.val = val
        break
      end
      search_node = search_node.next
    end
  end

  def remove(key)
    search_node = @head
    until search_node.key == "tail"
      if search_node.key == key
        search_node.prev.next = search_node.next
        search_node.next.prev = search_node.prev
        break
      end
      search_node = search_node.next
    end
    false
  end

  def each(&proc)
    search_node = first
    until search_node.key == "tail"
      proc.call(search_node)

      search_node = search_node.next
    end

    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
