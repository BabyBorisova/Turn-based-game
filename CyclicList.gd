extends Reference

# This is a cyclicly doubly linked list.
# There is a start (head) that is the entry point of the list

class CyclicListItem:
	
	extends Reference
	
	var next = null
	var previous = null
	var data = {}
	
	func _init(v):
		data = v
	
	# always links after the 'other'
	func link(other):
		self.next = other.next
		self.next.previous = self
		other.next = self
		self.previous = other
	
	func unlink():
		self.next.previous = self.previous
		self.previous.next = self.next

var start = null
var length = 0

func size() -> int:
	return self.length

# adds a new item to the end of the cycle
func append(value):
	var item = CyclicListItem.new(value)
	if self.length == 0:
		self.start = item
		self.start.next = item
		self.start.previous = item
		self.length += 1
		return
	item.link(self.start.previous)
	self.length += 1

# removes all instances of 'val' in the list
func remove_value(value):
	var current = self.start.next
	while (current != self.start):
		if (current.data == value):
			current.unlink()
			self.length -= 1
		current = current.next
	# only thing left is the start
	if (self.start.data == value):
		self.start.unlink()
		self.start = self.start.next
		self.length -= 1
	if self.length == 0:
		self.start = null

func clear():
	self.start = null
	self.length = 0
