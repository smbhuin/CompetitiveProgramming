// Prefix Sum Pattern
/*
func fn(_ arr: [Int]) -> [Int] {
    var prefix = Array(repeating: 0, count: arr.count)
    prefix[0] = arr[0]
    for i in 0..<arr.count {
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
}

