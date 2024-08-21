
public class Heap<Element : Comparable> : CustomStringConvertible, Equatable  {
    
    private var elements: [Element]
    private var condition: (Element, Element) -> Bool
    
    /// If condition is greater than (>) then it's a Max Heap other wise it's a Min Heap
    public init(_ condition: @escaping (Element, Element) -> Bool = { $0 > $1 }) {
        self.elements = []
        self.condition = condition
    }
    
    public var peek: Element? {
        elements.first
    }
    
    var count: Int { elements.count }
    
    public var isEmpty: Bool {
        elements.isEmpty
    }
    
    /// Utility function to balance heap after removing an element.
    func shiftDown() {
        let len = elements.count
        guard len > 0 else { return }
        var currentIndex = 0
        while true {
            let leftIndex = 2 * currentIndex + 1
            let rightIndex = 2 * currentIndex + 2
            if rightIndex < len {
                var maxNumIndex = 0
                if condition(elements[leftIndex], elements[rightIndex]) {
                    maxNumIndex = leftIndex
                }
                else {
                    maxNumIndex = rightIndex
                }
                if condition(elements[maxNumIndex], elements[currentIndex]) {
                    elements.swapAt(currentIndex, maxNumIndex)
                    currentIndex = maxNumIndex
                }
                else {
                    break
                }
            }
            else if leftIndex < len {
                if condition(elements[leftIndex], elements[currentIndex]) {
                    elements.swapAt(currentIndex, leftIndex)
                    currentIndex = leftIndex
                }
                else {
                    break
                }
            }
            else {
                break
            }
        }
    }
    
    /// Utility function to balance heap after inserting an element.
    func shiftUp() {
        var currentIndex = elements.count - 1
        while true {
            let parentIndex = (currentIndex - 1) / 2
            if parentIndex >= 0 {
                if condition(elements[currentIndex], elements[parentIndex]) {
                    elements.swapAt(currentIndex, parentIndex)
                    currentIndex = parentIndex
                }
                else {
                    break
                }
            }
            else {
                break
            }
        }
    }
    
    /// - Complexity: Time complexity is  O(logn), where n is the number of elements in array. Space complexity is O(1), only constant space is used.
    public func insert(_ item: Element) {
        self.elements.append(item)
        self.shiftUp()
    }
    
    /// Removes minimum element in case of min heap or maximum element in case of max heap.
    /// - Complexity: Time complexity is O(logn), where n is the number of elements in array. Space complexity is O(1), only constant space is used.
    @discardableResult
    public func remove() -> Element? {
        if let first = elements.first {
            let lastIndex = elements.count - 1
            elements[0] = elements[lastIndex]
            elements.removeLast()
            shiftDown()
            return first
        }
        return nil
    }
    
    public static func == (lhs: Heap<Element>, rhs: Heap<Element>) -> Bool {
        return lhs.elements == rhs.elements
    }
    
    public static func != (lhs: Heap<Element>, rhs: Heap<Element>) -> Bool {
        !(lhs == rhs)
    }
    
    public var description: String {
        return "[" + elements.map({String(describing: $0)}).joined(separator: ", ") + "]"
    }
}

public extension Solution {
    
    /// LeetCode: 215. Kth Largest Element in an Array.
    ///
    /// Solved using heap.
    ///
    /// - Complexity: Time complexity is O(*nlogn*) and space complexity is O(*n*), where n is the size of the array `nums`.
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        let heap: Heap<Int> = Heap(>) // Max Heap
        var k = k
        var result = 0
        guard nums.count >= k else {
            return -1
        }
        for num in nums {
            heap.insert(num)
        }
        while k > 0 {
            result = heap.remove() ?? 0
            k -= 1
        }
        return result
    }
    
}

/// LeetCode: 2336. Smallest Number in Infinite Set.
///
/// Solved using heap.
class SmallestInfiniteSet {
    var addedNums: Set<Int>
    let heap: Heap<Int> // Min heap
    var currentSmallest = 1
    
    init() {
        addedNums = []
        heap = Heap(<) // Min heap
    }
    
    /// - Complexity: Time complexity is O(*logn*) and space complexity is O(n), where n is the number of the numbers that is added back.
    func popSmallest() -> Int {
        if let top = heap.remove() {
            addedNums.remove(top)
            return top
        }
        defer { currentSmallest += 1 }
        return currentSmallest
    }
    
    /// - Complexity: Time complexity is O(*logn*) and space complexity is O(n), where n is the number of the numbers that is added back.
    func addBack(_ num: Int) {
        if num < currentSmallest {
            if !addedNums.contains(num) {
                addedNums.insert(num)
                heap.insert(num)
            }
        }
    }
}
