
class IterativeSolution : Solution {
    
    /// LeetCode: 234. Palindrome Linked List.
    ///
    /// Solved by iteration.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the size of the linked list.
    func isPalindrome(_ head: ListNode?) -> Bool {
        // 1. convert the linked list to array.
        var arr: [Int] = []
        var node = head
        while let n = node {
            arr.append(n.val)
            node = n.next
        }
        // 2. check if the array is palindrome.
        var left = 0, right = arr.count - 1
        while left < right {
            if arr[left] != arr[right] {
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}



