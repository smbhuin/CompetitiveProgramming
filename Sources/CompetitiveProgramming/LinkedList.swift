
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
    
    @discardableResult
    func append(_ element: Int) -> ListNode {
        self.next = ListNode(element)
        return self.next!
    }
    
    @discardableResult
    func append(_ node: ListNode) -> ListNode {
        self.next = node
        return self.next!
    }
    
    @discardableResult
    func append(contentsOf elements: [Int]) -> ListNode {
        var tail = self
        for e in elements {
            let node = ListNode(e)
            tail.next = node
            tail = node
        }
        return tail
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

public class LinkedListSolution : Solution {
    
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
    
    /// LeetCode: 206. Reverse Linked List.
    ///
    /// Solved by iteration.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the size of the linked list. Space complexity is O(1), only constant space is used.
    func reverseList(_ head: ListNode?) -> ListNode? {
        var newHead: ListNode? = nil
        var curr = head
        while let c = curr {
            let next = c.next
            c.next = newHead
            newHead = c
            curr = next
        }
        return newHead
    }
    
    /// LeetCode: 2130. Maximum Twin Sum of a Linked List.
    ///
    /// Solved by iteration.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the size of the linked list. Space complexity is O(1), only constant space is used.
    func pairSum(_ head: ListNode?) -> Int {
        // Find mid
        var slow = head
        var fast = head
        var prev: ListNode?
        while fast?.next != nil {
            fast = fast?.next?.next
            prev = slow
            slow = slow?.next
        }
        prev?.next = nil // break the linked list into two
        // Reverse mid to end (second part)
        var mid: ListNode? = nil
        var curr = slow
        while let c = curr {
            let next = c.next
            c.next = mid
            mid = c
            curr = next
        }
        // Iterate both part of the linked list
        var start = head
        var maxSum = 0
        while start != nil && mid != nil {
            maxSum = max(maxSum, start!.val + mid!.val)
            start = start!.next
            mid = mid!.next
        }
        return maxSum
    }
    
    /// LeetCode: 160. Intersection of Two Linked Lists.
    ///
    /// Solved by iteration.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the size of the linked list. Space complexity is O(1), only constant space is used.
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var a = headA
        var b = headB
        while a !== b {
            if a == nil && b == nil {
                return nil
            }
            else if a == nil {
                a = headB
            }
            else if b == nil {
                b = headA
            }
            else {
                a = a!.next
                b = b!.next
            }
        }
        return a
    }
    
    /// LeetCode: 234. Palindrome Linked List.
    ///
    /// Solved by reversing the second half of the linked list.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the size of the linked list. Space complexity is O(1), only constant space is used.
    func isPalindrome(_ head: ListNode?) -> Bool {
        // 1. find the mid of the linked list.
        var slow: ListNode? = head
        var fast: ListNode? = head?.next
        while let s = slow, let f = fast, let fn = f.next {
            slow = s.next
            fast = fn.next
        }
        // 2. reverse the second half of linked list.
        var prev: ListNode? = nil
        var curr: ListNode? = slow?.next
        while let c = curr {
            let next: ListNode? = c.next
            c.next = prev
            prev = c
            curr = next
        }
        slow?.next = nil
        // 3. compare first half and reversed second half of the linked list.
        var headA = head
        var headB = prev
        while let a = headA, let b = headB {
            if a.val != b.val {
                return false
            }
            headA = a.next
            headB = b.next
        }
        return true
    }
    
    /// LeetCode: 24. Swap Nodes in Pairs.
    ///
    /// Solved by reversing the second half of the linked list.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the size of the linked list. Space complexity is O(1), only constant space is used.
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var left: ListNode? = dummy
        var mid = head
        var right = head?.next
        while let r = right {
            mid?.next = r.next
            r.next = mid
            left?.next = r
            left = mid
            mid = mid?.next
            right = mid?.next
        }
        return dummy.next
    }
    
    /// LeetCode: 142. Linked List Cycle II.
    ///
    /// Solved using Floyd’s Cycle-Finding Algorithm.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the size of the linked list. Space complexity is O(1), only constant space is used.
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var slow = head
        var fast = head
        while slow != nil && fast != nil && fast!.next != nil {
            slow = slow!.next
            fast = fast!.next!.next
            if slow === fast { // has cycle
                var head = head
                while head !== slow {
                    head = head?.next
                    slow = slow?.next
                }
                return head
            }
        }
        return nil
    }
    
    /// LeetCode: 287. Find the Duplicate Number.
    ///
    /// Solved using Floyd’s Cycle-Finding Algorithm.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the size of the array `nums`. Space complexity is O(1), only constant space is used.
    func findDuplicate(_ nums: [Int]) -> Int {
        var slow = 0
        var fast = 0
        while true {
            slow = nums[slow]
            fast = nums[nums[fast]]
            if slow == fast { // has cycle
                var start = 0
                while start != slow { // finding cycle position
                    start = nums[start]
                    slow = nums[slow]
                }
                return start
            }
        }
        return slow
    }
    
}
