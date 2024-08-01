
/// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public extension ListNode {
    
    /// Create a linked list with the elements from the  array and returns head.
    class func buildLinkedList(_ elements: [Int]) -> ListNode? {
        let dummyHead = ListNode(0)
        var tail = dummyHead
        for e in elements {
            let node = ListNode(e)
            tail.next = node
            tail = node
        }
        return dummyHead.next
    }
    
    /// Returns array representation for the linked list.
    func allElements() -> [Int] {
        var elements: [Int] = []
        var tail: ListNode? = self
        while let t = tail {
            elements.append(t.val)
            tail = t.next
        }
        return elements
    }
}

public extension Solution {
    
    /// LeetCode: 2095. Delete the Middle Node of a Linked List.
    ///
    /// Solved using fast and slow pointers.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the size of the linked list. Space complexity is O(1), only constant space is used.
    func deleteMiddle(_ head: ListNode?) -> ListNode? {
        let dummyHead = ListNode(0, head)
        var slow: ListNode? = dummyHead
        var fast: ListNode? = dummyHead.next?.next
        while let f = fast {
            slow = slow?.next
            fast = f.next?.next
        }
        guard let slow = slow else {
            return nil
        }
        slow.next = slow.next?.next
        return dummyHead.next
    }
    
    /// LeetCode: 328. Odd Even Linked List.
    ///
    /// Solved by keeping a referance of the tail of odd list.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the size of the linked list. Space complexity is O(1), only constant space is used.
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var oddTail = head
        var prev = head
        var curr = head?.next
        var currIdx = 2 // here index starts from 1
        while let c = curr {
            if currIdx % 2 != 0 { // even
                let tn = oddTail?.next
                oddTail?.next = c
                prev?.next = c.next
                c.next = tn
                oddTail = c
            }
            else {
                prev = c
            }
            curr = prev?.next
            currIdx += 1
        }
        return head
    }
}
