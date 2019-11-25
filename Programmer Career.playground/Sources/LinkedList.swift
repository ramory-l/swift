public struct LinkedList<Value> {
    
    public var head: Node<Value>?
    public var tail: Node<Value>?
    public var count: Int = 0
    
    public init() {}
    
    public var isEmpty: Bool {
        head == nil
    }
    
    public mutating func push(_ value: Value) {
        copyNodes()
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
        count += 1
    }
    
    public mutating func append(_ value: Value) {
        copyNodes()
        // 1
        guard !isEmpty else {
            push(value)
            return
        }
        
        // 2
        tail!.next = Node(value: value)
        
        // 3
        tail = tail!.next
        count += 1
    }
    
    public func node(at index: Int) -> Node<Value>? {
        // 1
        var currentNode = head
        var currentIndex = 0
        
        // 2
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    // 1
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>)
        -> Node<Value> {
            copyNodes()
            // 2
            guard tail !== node else {
                append(value)
                return tail!
            }
            // 3
            node.next = Node(value: value, next: node.next)
            count += 1
            return node.next!
    }
    
    @discardableResult
    public mutating func pop() -> Value? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        count -= 1
        return head?.value
    }
    @discardableResult
    public mutating func removeLast() -> Value? {
        copyNodes()
        // 1
        guard let head = head else {
            return nil
        }
        // 2
        guard head.next != nil else {
            return pop()
        }
        // 3
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }
        // 4
        prev.next = nil
        tail = prev
        count -= 1
        return current.value
    }
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        guard let node = copyNodes(returningCopyOf: node) else { return nil }
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        count -= 1
        return node.next?.value
    }
    @discardableResult
    public mutating func remove(node: Node<Value>) -> Value? {
        guard let node = copyNodes(returningCopyOf: node) else { return nil }
        if node === tail {
            return removeLast()
        } else if node === head {
            return pop()
        }
        var previous = head
        while let current = previous?.next {
            if current === node {
                previous?.next = current.next
                break
            }
            previous = previous?.next
        }
        count -= 1
        return node.value
    }
    private mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        guard var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        
        tail = newNode
    }
    private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
        guard !isKnownUniquelyReferenced(&head) else {
            return nil
        }
        guard var oldNode = head else {
            return nil
        }
        
        head = Node(value: oldNode.value)
        var newNode = head
        var nodeCopy: Node<Value>?
        
        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        
        return nodeCopy
    }
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

extension LinkedList: Collection {
    
    public struct Index: Comparable {
        
        public var node: Node<Value>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    // 1
    public var startIndex: Index {
        Index(node: head)
    }
    // 2
    public var endIndex: Index {
        Index(node: tail?.next)
    }
    // 3
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    // 4
    public subscript(position: Index) -> Value {
        position.node!.value
    }
}

extension LinkedList where Value: Equatable {
    
    public mutating func removeAll(_ value: Value) {
        while let head = self.head, head.value == value {
            self.head = head.next
        }
        var prev = head
        var current = head?.next
        while let currentNode = current {
            guard currentNode.value != value else {
                prev?.next = currentNode.next
                current = prev?.next
                count -= 1
                continue
            }
            prev = current
            current = current?.next
        }
        tail = prev
    }
    public mutating func removeAllDuplicates() {
        var previousNode = self.head
        while previousNode != nil {
            var beforeCurrent = previousNode
            var currentNode = beforeCurrent?.next
            let currentValue = previousNode?.value
            while currentNode != nil {
                if currentNode?.value == currentValue {
                    beforeCurrent?.next = currentNode?.next
                    currentNode = beforeCurrent?.next
                    count -= 1
                } else {
                    currentNode = currentNode?.next
                    beforeCurrent = beforeCurrent?.next
                }
            }
            previousNode = previousNode?.next
        }
    }
}
