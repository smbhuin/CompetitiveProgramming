
public extension Solution {
    
    /// LeetCode: 338. Counting Bits.
    ///
    /// Solved using bit manipulation.
    ///
    /// - Complexity: Time complexity is O(*nlogn*), where *n* is the provided number and space complexity is O(1), only constant space is used.
    func countBits(_ n: Int) -> [Int] {
        var result = Array(repeating: 0, count: n + 1)
        for i in 0...n {
            var num = UInt(i)
            var count = UInt(0)
            while num > 0 {
                count += num & 1
                num = num >> 1
            }
            result[i] = Int(count)
        }
        return result
    }

}
