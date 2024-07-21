
public extension Solution {
    
    /// LeetCode: 283. Move Zeroes.
    ///
    /// Solved by iteration using extra space. Need to optimize.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where n is the length of the string.
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        var ans = Array(repeating: 0, count: nums.count)
        for num in nums {
            if num != 0 {
                ans[i] = num
                i += 1
            }
        }
        nums = ans
    }
    
    /// LeetCode: 283. Move Zeroes.
    ///
    /// Solved by iteration using two pointers.
    ///
    /// Taking long time. Need to optimize.
    ///
    /// e.g. nums = [0,1,0,3,12] => [1,0,0,3,12] => [1,3,0,0,12] => [1,3,12,0,0]
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(1), where n is the length of the string.
    func moveZeroesII(_ nums: inout [Int]) {
        var i = 0, j = 0
        while i < nums.count && j < nums.count {
            nums.swapAt(i, j)
            while i < nums.count && nums[i] != 0 {
                i += 1
            }
            j = i + 1
            while j < nums.count && nums[j] == 0 {
                j += 1
            }
        }
    }
    
    /// LeetCode: 283. Move Zeroes.
    ///
    /// Solved by iteration using two pointers.
    ///
    /// Optimized solution.
    ///
    /// e.g. nums = [0,1,0,3,12] => [1,0,0,3,12] => [1,3,0,0,12] => [1,3,12,0,0]
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(1), where n is the length of the string.
    func moveZeroesIII(_ nums: inout [Int]) {
        var i = 0, j = 1
        while j < nums.count {
            // find the index of 0 to the left of j
            while i < j && nums[i] != 0 {
                i += 1
            }
            // if we found 0 to the left of j
            if i != j {
                nums.swapAt(i, j)
            }
            j += 1
        }
    }
    
    /// LeetCode: 392. Is Subsequence.
    ///
    /// Solved by iteration using two pointers.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the length of the string. Space complexity is O(1), only constant space is used.
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.isEmpty {
            return true
        }
        var si: String.Index = s.startIndex, ti: String.Index = t.startIndex
        let send = s.endIndex, tend = t.endIndex
        while ti < tend {
            if s[si] == t[ti] {
                si = s.index(after: si)
                if si >= send {
                    return true
                }
            }
            ti = t.index(after: ti)
        }
        return false
    }
    
    /// LeetCode: 11. Container With Most Water
    ///
    /// Solved by iteration using two pointers.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the length of the string. Space complexity is O(1), only constant space is used.
    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var maxArea = 0
        while left < right {
            let dis = right-left
            let hei = min(height[left], height[right])
            maxArea = max(maxArea, dis * hei)
            if height[left] < height[right] {
                left += 1
            }
            else {
                right -= 1
            }
        }
        return maxArea
    }
    
    /// LeetCode: 1679. Max Number of K-Sum Pairs.
    ///
    /// Solved by sorting & iteration using two pointers.
    ///
    /// - Complexity: Time complexity is O(*nlogn*), where n is the size of the array `nums`. Space complexity is O(1), only constant space is used.
    func maxOperationsI(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var left = 0, right = nums.count - 1
        var count = 0
        while left < right {
            let sum = nums[left] + nums[right]
            if sum == k {
                count += 1
                left += 1
                right -= 1
            }
            else if sum > k {
                right -= 1
            }
            else {
                left += 1
            }
        }
        return count
    }
    
    /// LeetCode: 1679. Max Number of K-Sum Pairs.
    ///
    /// Solved using frequency map.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the size of the array `nums`. Space complexity is O(1), only constant space is used.
    func maxOperationsII(_ nums: [Int], _ k: Int) -> Int {
        var frequencyMap: [Int:Int] = [:]
        var count = 0
        for num in nums {
            let rem = k - num
            let freq = frequencyMap[rem, default:0]
            if freq > 0 {
                frequencyMap[rem] = freq - 1
                count += 1
            }
            else {
                frequencyMap[num] = frequencyMap[num, default: 0] + 1
            }
        }
        return count
    }

}

