
public extension Solution {
    
    /// LeetCode: 1137. N-th Tribonacci Number.
    ///
    /// Solved using dynamic programming (Tabulation).
    ///
    /// - Complexity: Time complexity is O(1) and space complexity is O(1), only constant space is used.
    func tribonacci(_ n: Int) -> Int {
        var series = Array(repeating:0, count:38)
        series[1] = 1
        series[2] = 1
        for i in 3..<38 {
            series[i] = series[i-3] + series[i-2] + series[i-1]
        }
        return series[n]
    }
    
    /// LeetCode: 1137. N-th Tribonacci Number.
    ///
    /// Solved using dynamic programming (Memoization).
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the index of fibonacci number we are looking for.
    func tribonacciII(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 || n == 2 { return 1 }
        if tribonacciMemo[n] > 0 { // tribonacciMemo is stored in `Solution` class.
            return tribonacciMemo[n]
        }
        tribonacciMemo[n] = tribonacciII(n - 3) + tribonacciII(n - 2) + tribonacciII(n - 1)
        return tribonacciMemo[n]
    }
    
    /// LeetCode: 746. Min Cost Climbing Stairs.
    ///
    /// Solved using dynamic programming (Memoization).
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of steps on a staircase.
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        let n = cost.count
        var dp = Array(repeating: 0, count: n)
        func findCost(_ index: Int) -> Int {
            if index >= n {
                return 0
            }
            if dp[index] > 0 {
                return dp[index]
            }
            dp[index] = cost[index] + min(findCost(index + 1), findCost(index + 2))
            return dp[index]
        }
        return min(findCost(0), findCost(1))
    }
    
}
