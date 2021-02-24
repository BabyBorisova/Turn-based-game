extends Reference

# Items to be linked
class LinkedListItem:
	extends Reference
	
	var next = null
	var previous = null
	var data = {}
	
	func _init(v):
		data = v
	
	# always adds after the 'other'
	func link(other):
		if other.next:
			self.next = other.next
			self.next.previous = self
		other.next = self
		self.previous = other
	
	func unlink():
		if self.next:
			self.next.previous = self.previous
		if self.previous:
			self.previous.next = self.next

# Linked list implementation
var _head = null
var _tail = null
var _length:int = 0

func size() -> int: 
	return self._length

func pushback(val):
	if self._length == 0:
		self._head = LinkedListItem.new(val)
		self._tail = self._head
	else:
		var newTail = LinkedListItem.new(val)
		newTail.link(_tail)
		self._tail = newTail
	_length += 1

func pushfront(val):
	if self._length == 0:
		self._head = LinkedListItem.new(val)
		self._tail = self._head
	else:
		var newHead = LinkedListItem.new(val)
		_head.link(newHead)
		self._head = newHead
	_length += 1

func popback():
	if _length == 0:
		return null;
	else:
		var result = _tail.data
		_tail = _tail.previous
		_length -= 1
		return result

func popfront():
	if self._length == 0:
		return null
	else:
		var result = _head.data
		_head = _head.next
		_length -= 1
		return result

# indexed from 0
func insert(val, index:int):
	if (index < 0) or (index > _length):
		return
	if index == 0:
		pushfront(val)
		return
	if index == _length:
		pushback(val)
		return
	else:
		var current = _head
		var counter = 1
		while (current):
			if counter == index:
				var item = LinkedListItem.new(val)
				item.link(current)
				_length += 1
				return
			counter += 1
			current = current.next

# must use the same data type
func remove_by_val(val):
	if _head.data == val:
		self.popfront()
		return
	if _tail.data == val:
		self.popback()
		return
		
	var current = _head.next
	while(current.next):
		if (current.data == val):
			current.unlink()
			_length -= 1
			return
		current = current.next
