
public class BruteForceSolution : Solution {
    
    /// LeetCode: 560. Subarray Sum Equals K.
    ///
    /// Solved using brute force approach.
    ///
    /// - Complexity: Time complexity is close to O(*n^3*),  where *n* is the size of the array `nums`. Space complexity is O(1), only constant space is used.
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var count = 0
        for i in 0..<n {
            for j in i..<n {
                var sum = 0
                for m in i...j {
                    sum += nums[m]
                }
                if sum == k {
                    count += 1
                }
            }
        }
        return count
    }
    
    /// LeetCode: 160. Intersection of Two Linked Lists.
    ///
    /// Solved by iteration.
    ///
    /// - Complexity: Time complexity is O(*n^2*), where *n* is the size of the linked list. Space complexity is O(1), only constant space is used.
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var nodeA = headA
        while let na = nodeA {
            var nodeB = headB
            while let nb = nodeB {
                if na === nb {
                    return na
                }
                nodeB = nb.next
            }
            nodeA = na.next
        }
        return nil
    }
    
    /// LeetCode: 239. Sliding Window Maximum.
    ///
    /// Solved by iteration using sliding window.
    ///
    /// - Complexity: Time complexity is O(*k*(n-k)*), where *n* is the size of the array `nums` and *k* is the window size.  Space complexity is O(1), only constant space is used.
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var ans: [Int] = []
        var left = 0
        for right in (k-1)..<nums.count {
            var maxNum = Int.min
            for i in left...right {
                maxNum = max(maxNum, nums[i])
            }
            ans.append(maxNum)
            left += 1
        }
        return ans
    }
    
    /// LeetCode: 41. First Missing Positive.
    ///
    /// Solved by iteration.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the size of the array `nums`.
    func firstMissingPositive(_ nums: [Int]) -> Int {
        let numSet = Set(nums)
        for i in 1...Int.max {
            if !numSet.contains(i) {
                return i
            }
        }
        return 1
    }
    
}
