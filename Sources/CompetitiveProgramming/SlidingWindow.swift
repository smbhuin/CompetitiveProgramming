
// Sliding Window Pattern
/*func fn(_ arr: [Int]) -> Int {
    var left = 0, ans = 0, curr = 0

    for right in 0..<arr.count {
        // do logic here to add arr[right] to curr

        while WINDOW_CONDITION_BROKEN {
            // remove arr[left] from curr
            left += 1
        }
        
        // update ans
    }
    return ans
}*/

public extension Solution {
    
    /// LeetCode: 643. Maximum Average Subarray I.
    ///
    /// Solved by iteration using sliding window.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the size of the array `nums`.  Space complexity is O(1), only constant space is used.
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var start = 0, end = k, sum = 0.0
        for i in start..<end {
            sum += Double(nums[i])
        }
        var avg = sum / Double(k)
        while end < nums.count {
            sum -= Double(nums[start])
            sum += Double(nums[end])
            start += 1
            end += 1
            avg = max(avg, sum / Double(k))
        }
        return avg
    }
}
