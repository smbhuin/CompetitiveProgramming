
public class QueueNode<Element>: CustomStringConvertible, Equatable {
    public var value: Element
    public var next: QueueNode<Element>?
    public var prev: QueueNode<Element>?
    
    public init(_ value: Element) {
        self.value = value
    }
    
    public init(_ value: Element, _ next: QueueNode<Element>?, _ prev:  QueueNode<Element>?) {
        self.value = value
        self.next = next
    }
    
    public var description: String {
        if let v = value as? CustomStringConvertible {
            return v.description
        }
        return "<Node-\(value)>"
    }
    
    public static func == (lhs: QueueNode<Element>, rhs: QueueNode<Element>) -> Bool {
        return lhs.description == rhs.description
    }
    
}

/// Dynamic Queue & Deque Implementation.
public class Queue<Element> : ExpressibleByArrayLiteral {

    private var head: QueueNode<Element>?
    private var tail: QueueNode<Element>?
    private var size: Int = 0
    
    /// Creates queue with elements from array.
    public init(_ elements: [Element] = []) {
        guard let first = elements.first else { return }
        let head = QueueNode<Element>(first)
        var prev: QueueNode<Element> = head
        for index in 1..<elements.count {
            let node = QueueNode<Element>(elements[index])
            prev.next = node
            node.prev = prev
            prev = prev.next!
        }
        self.head = head
        self.tail = prev
        self.size = elements.count
    }
    
    /// Creates queue from array expression.
    public required convenience init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
    /// Pushes an element at the front of the queue.
    ///
    /// - Complexity: Time and space complexity is O(1).
    public func pushFront(_ element: Element) {
        let node = QueueNode<Element>(element)
        if let head = self.head {
            node.next = head
            head.prev = node
            self.head = node
        }
        else {
            self.head = node
            self.tail = node
        }
        self.size += 1
    }
    
    /// Pushes an element at the back of the queue.
    ///
    /// - Complexity: Time and space complexity is O(1).
    public func pushBack(_ element: Element) {
        let node = QueueNode<Element>(element)
        if let tail = self.tail {
            tail.next = node
            node.prev = tail
            self.tail = node
        }
        else {
            self.head = node
            self.tail = node
        }
        self.size += 1
    }
    
    /// Pops an element from the front of the queue. Time complexity: O(1)
    ///
    /// - Complexity: Time and space complexity is O(1).
    @discardableResult
    public func popFront() -> Element? {
        if let head = self.head {
            self.head = head.next
            if let head = self.head {
                head.prev = nil
            }
            else {
                self.tail = nil
            }
            self.size -= 1
            return head.value
        }
        return nil
    }
    
    /// Pops an element from the back of the queue.
    ///
    /// - Complexity: Time and space complexity is O(1).
    @discardableResult
    public func popBack() -> Element? {
        if let tail = self.tail {
            self.tail = tail.prev
            tail.prev = nil
            if self.tail == nil {
                self.head = nil
            }
            self.size -= 1
            return tail.value
        }
        return nil
    }

    /// Returns first element of the queue.
    public var front: Element? {
        self.head?.value
    }
    
    /// Returns last element of the queue.
    public var back: Element? {
        self.tail?.value
    }

    /// A Boolean value indicating whether the queue is empty.
    ///
    /// - Complexity: Time and space complexity is O(1).
    public var isEmpty: Bool {
        self.head == nil
    }
    
    /// The number of elements in the queue.
    public var count: Int {
        self.size
    }
}

extension Queue where Element == Int {
    public convenience init() {
        self.init([])
    }
}

extension Queue: CustomStringConvertible {
    
    /// A textual representation of the queue.
    public var description: String {
        var arr: [String] = []
        var temp: QueueNode<Element>? = head
        while let t = temp {
            arr.append(t.description)
            temp = t.next
        }
        return "[" + arr.joined(separator: ", ") + "]"
    }
    
}

extension Queue: CustomDebugStringConvertible {

    public var debugDescription: String {
        var elements: [String] = []
        var temp: QueueNode<Element>? = head
        while let t = temp {
            elements.append(t.description)
            temp = t.next
        }
        return """
        [Front<-\(elements.map { "\($0)" }.joined(separator: "--"))->Back]
        """
    }
}

/// LeetCode: 933. Number of Recent Calls.
///
/// Solved using queue.
///
/// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of calls.
class RecentCounter {

    var queue: [Int]

    init() {
        queue = []
    }
    
    func ping(_ t: Int) -> Int {
        queue.append(t)
        while let first = queue.first, first < t - 3000 {
            queue.removeFirst()
        }
        return queue.count
    }
}

public extension Solution {
    
    
    /// LeetCode: 649. Dota2 Senate.
    ///
    /// Solved using two queue.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of members in senate.
    func predictPartyVictory(_ senate: String) -> String {
        let senate = Array(senate)
        var radiantQueue: [Int] = [] // Holds indices of radiants in sanate
        var direQueue: [Int] = [] // Holds indices of dires in sanate
        for i in 0..<senate.count {
            if senate[i] == "R" {
                radiantQueue.append(i);
            }
            else {
                direQueue.append(i);
            }
        }
        while !radiantQueue.isEmpty && !direQueue.isEmpty {
            let r = radiantQueue.removeFirst()
            let d = direQueue.removeFirst()
            if r < d {
                radiantQueue.append(r + senate.count)
            }
            else {
                direQueue.append(d + senate.count)
            }
        }
        return radiantQueue.isEmpty ? "Dire" : "Radiant"
    }
}
