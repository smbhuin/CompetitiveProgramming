
public extension Solution {
    
    /// LeetCode: 238. Product of Array Except Self
    ///
    /// Solved by iteration using two pointers.
    ///
    /// nums = [1, 2, 3, 4]
    ///
    /// prefix products = [1, 1, 2, 6]
    ///
    /// suffix products = [24,12, 4, 1]
    ///
    /// result = pefix * suffix i.e. [24, 12, 8, 6]
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the count of the `nums`. Space complexity is O(1), only constant extra space is used.
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = Array(repeating: 1, count: n)
        var tmp = 1
        for i in stride(from: 1, to: n, by: 1) {
            tmp *= nums[i-1]
            result[i] = tmp
        }
        tmp = 1
        for i in stride(from: n - 2 , through: 0, by: -1) {
            tmp *= nums[i+1]
            result[i] *= tmp
        }
        return result
    }
    
    /// LeetCode: 334. Increasing Triplet Subsequence
    ///
    /// Solved by iteration.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(1), where n is the size of the array `nums`.
    func increasingTriplet(_ nums: [Int]) -> Bool {
        var firstMin = Int.max
        var secondMin = Int.max
        for num in nums {
            if num <= firstMin {
                firstMin = num
            }
            else if num <= secondMin {
                secondMin = num
            }
            else {
                return true
            }
        }
        return false
    }
    
    /// LeetCode: 443. String Compression
    ///
    /// Solved by iteration.
    ///
    /// - Parameter chars: array of `Character`.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(1), where n is the size of the array `chars`.
    func compress(_ chars: inout [Character]) -> Int {
        var lastChar = chars[0]
        var len = 0, count = 1
        for i in 1..<chars.count {
            if chars[i] == lastChar {
                count += 1
            }
            else {
                chars[len] = lastChar
                len += 1
                lastChar = chars[i]
                if count > 1 {
                    let str = String(count)
                    for digit in str {
                        chars[len] = digit
                        len += 1
                    }
                }
                count = 1
            }
        }
        chars[len] = lastChar
        len += 1
        if count > 1 {
            let str = String(count)
            for digit in str {
                chars[len] = digit
                len += 1
            }
        }
        return len
    }
    
    /// LeetCode: 649. Dota2 Senate.
    ///
    /// Solved using array. Bruteforce approach.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of members in senate.
    func predictPartyVictoryII(_ senate: String) -> String {
        var arr = Array(senate)
        while arr.count > 1 {
            let f = arr.removeFirst()
            if let indx = arr.firstIndex(of: f == "R" ? "D" : "R") {
                arr.remove(at: indx)
            }
            else {
                break
            }
            arr.append(f)
        }
        if arr.first == "R" {
            return "Radiant"
        }
        else {
            return "Dire"
        }
    }
    
    /// LeetCode: 75. Sort Colors.
    ///
    /// Solved by counting color counts.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the size of the array `nums`. Space complexity is O(1), only constant extra space is used.
    func sortColors(_ nums: inout [Int]) {
        var red = 0
        var white = 0
        var blue = 0
        for num in nums {
            switch num {
                case 0:
                red += 1
                case 1:
                white += 1
                default:
                blue += 1
            }
        }
        var i = 0
        for _ in 0..<red {
            nums[i] = 0
            i += 1
        }
        for _ in 0..<white {
            nums[i] = 1
            i += 1
        }
        for _ in 0..<blue {
            nums[i] = 2
            i += 1
        }
    }

}
