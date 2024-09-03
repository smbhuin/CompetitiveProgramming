
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
    
    /// LeetCode: 136. Single Number.
    ///
    /// Solved using bit manipulation.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the size of the array `nums`. Space complexity is O(1), only constant space is used.
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            result ^= num
        }
        return result
    }
    
    /// LeetCode: 1318. Minimum Flips to Make a OR b Equal to c.
    ///
    /// Solved using bit manipulation.
    ///
    /// - Complexity: Time complexity is O(1), and space complexity is O(1), only constant space is used.
    func minFlips(_ a: Int, _ b: Int, _ c: Int) -> Int {
        var count = 0
        var i = 0
        while i < 30 {
            let aBit = (a >> i) & 1
            let bBit = (b >> i) & 1
            let cBit = (c >> i) & 1
            if cBit == 1 {
                if aBit == 0 && bBit == 0 {
                    count += 1
                }
            }
            else { // 0
                if aBit == 1 || bBit == 1 {
                    count += 1
                    if aBit == 1 && bBit == 1 {
                        count += 1
                    }
                }
            }
            i += 1
        }
        return count
    }

}
