
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
    
    /// LeetCode: 1456. Maximum Number of Vowels in a Substring of Given Length.
    ///
    /// Solved by iteration using sliding window.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the length of the string `s`.  Space complexity is O(1), only constant space is used.
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let str = Array(s)
        var left = 0, curr = 0, ans = 0
        let vowels: Set<Character> = ["a","e","i","o","u"]
        for right in 0..<str.count {
            if vowels.contains(str[right]) {
                curr += 1
            }
            while right - left + 1 > k { // if window size is greater that k
                if vowels.contains(str[left]) {
                    curr -= 1
                }
                left += 1
            }
            ans = max(ans, curr)
        }
        return ans
    }
    
    /// LeetCode: 1004. Max Consecutive Ones III.
    ///
    /// Solved by iteration using sliding window.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the size of the array `nums`.  Space complexity is O(1), only constant space is used.
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var left = 0, right = 0, k = k
        while right < nums.count {
            if nums[right] == 0 {
                k -= 1
            }
            if k < 0 {
                if nums[left] == 0 {
                    k += 1
                }
                left += 1
            }
            right += 1
        }
        return right-left
    }
}
