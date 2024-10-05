public extension Solution {
    
    /// LeetCode: 390. Removing Stars From a String.
    ///
    /// Solved using stack.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the length of the string `s`.  Space complexity is O(*n*), where n is the length of the string `s`.
    func removeStars(_ s: String) -> String {
        var ans: [Character] = [] // acts like stack
        for c in s {
            if c == "*" {
                ans.removeLast()
            }
            else {
                ans.append(c)
            }
        }
        return String(ans)
    }
    
    /// LeetCode: 735. Asteroid Collision.
    ///
    /// Solved using stack.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the size of the array `asteroids`.
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack: [Int] = []
        for curr in asteroids {
            var right = curr
            while let left = stack.last, left > 0, right < 0 { // collide possible
                if left == -right {
                    stack.removeLast()
                    right = 0
                }
                else if left < -right {
                    stack.removeLast()
                }
                else {
                    right = 0
                }
            }
            if right != 0 {
                stack.append(right)
            }
        }
        return stack
    }
    
    /// LeetCode: 394. Decode String.
    ///
    /// Solved using stack.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the length of the string `s`.
    func decodeString(_ s: String) -> String {
        var result = [Character]()
        for c in s {
            if c == "]" {
                let lastIndex = result.count - 1
                let index = result.lastIndex(of: "[")!
                let targetStr = result[index + 1...lastIndex]
                result.removeSubrange(index...lastIndex)

                var nums = [Int]()
                
                while result.last?.isNumber == true {
                    nums.insert(result.removeLast().wholeNumberValue!, at: 0)
                }

                let num = nums.reduce(0, { $0 * 10 + $1 })

                for _ in 0..<num {
                    result.append(contentsOf: targetStr)
                }
            } else {
                result.append(c)
            }
        }
        return String(result)
    }
    
    /// LeetCode: 739. Daily Temperatures.
    ///
    /// Solved using monotonic stack.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of days.
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var ans = Array(repeating: 0, count: temperatures.count)
        var stack: [(Int, Int)] = []
        for index in stride(from: temperatures.count - 1, through: 0, by: -1) {
            while let top = stack.last, top.1 <= temperatures[index] {
                stack.removeLast()
            }
            if let top = stack.last {
                ans[index] = top.0 - index
            }
            stack.append((index, temperatures[index]))
        }
        return ans
    }
    
    /// LeetCode: 84. Largest Rectangle in Histogram.
    ///
    /// Solved using stack.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of `heights`.
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let n = heights.count
        var stack: [(index:Int,value:Int)] = []
        var maxArea = Int.min
        for (i,v) in heights.enumerated() {
            if let top = stack.last, top.value > v {
                var lastIndex = i
                // remove all values in stack that is greater than v.
                while let t = stack.last, t.value >= v {
                    maxArea = max(maxArea, (i - t.index) * t.value)
                    stack.removeLast()
                    lastIndex = t.index
                }
                stack.append((lastIndex,v))
            }
            else {
                stack.append((i,v))
            }
        }
        while let t = stack.last {
            maxArea = max(maxArea, (n - t.index) * t.value)
            stack.removeLast()
        }
        return maxArea
    }
    
}

/// LeetCode: 901. Online Stock Span.
///
/// Solved using monotonic stack.
///
class StockSpanner {
    var index: Int
    var stack: [(Int,Int)] // (index, price)

    init() {
        index = 0
        stack = []
    }
    
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of days.
    func next(_ price: Int) -> Int {
        while let top = stack.last, top.1 <= price {
            stack.removeLast()
        }
        var span = 0
        if let top = stack.last {
            span = index - top.0
        }
        else {
            span = index + 1
        }
        stack.append((index, price))
        index += 1
        return span
    }
}

