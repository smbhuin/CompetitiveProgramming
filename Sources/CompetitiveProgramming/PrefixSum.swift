// Prefix Sum Pattern
/*
func fn(_ arr: [Int]) -> [Int] {
    var prefix = Array(repeating: 0, count: arr.count)
    prefix[0] = arr[0]
    for i in 1..<arr.count {
        prefix[i] = prefix[i - 1] + arr[i]
    }
    return prefix
}
*/

public extension Solution {
    
    /// LeetCode: 1732. Find the Highest Altitude.
    ///
    /// Solved by iteration following prefix sum pattern.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the size of the array `gain`.  Space complexity is O(1), only constant space is used.
    func largestAltitude(_ gain: [Int]) -> Int {
        var alt = 0, sum = 0
        for i in 0..<gain.count {
            sum += gain[i]
            alt = max(alt, sum)
        }
        return alt
    }
    
    /// LeetCode: 724. Find Pivot Index.
    ///
    /// Solved by iteration following prefix sum pattern.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the size of the array `nums`.  Space complexity is O(1), only constant space is used.
    func pivotIndex(_ nums: [Int]) -> Int {
        var prefixSum = Array(repeating: 0, count: nums.count)
        var suffixSum = Array(repeating: 0, count: nums.count)
        for i in stride(from: 1, to: nums.count, by: 1) {
            prefixSum[i] = prefixSum[i - 1] + nums[i - 1]
        }
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            suffixSum[i] = suffixSum[i + 1] + nums[i + 1]
        }
        for i in stride(from: 0, to: nums.count, by: 1) {
            if prefixSum[i] == suffixSum[i] {
                return i
            }
        }
        return -1
    }
}

