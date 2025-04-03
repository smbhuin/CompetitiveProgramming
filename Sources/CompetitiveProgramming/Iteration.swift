
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
    
    /// Reverse Integer.
    ///
    /// Solved by iteration.
    ///
    /// - Seealso: [Leetcode 7](https://leetcode.com/problems/reverse-integer/description/)
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of digits in number `x`.
    func reverse(_ x: Int) -> Int {
        var num = x, res = 0
        let intMax = 2_147_483_647, intMin = -2_147_483_648
        while num != 0 {
            let r = num % 10 // pop last digit
            if res > intMax / 10 || res == intMax / 10 && r > 7 {
                return 0
            }
            if res < intMin / 10 || res == intMin / 10 && r < -8 {
                return 0
            }
            res = res * 10 + r // push the last digit
            num = num / 10
        }
        return res
    }
}



