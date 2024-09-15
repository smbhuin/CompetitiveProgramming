
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
    
    /// LeetCode: 7198. House Robber.
    ///
    /// Solved using dynamic programming (Tabulation).
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of houses.
    func rob(_ nums: [Int]) -> Int {
        var dp = Array(repeating:0, count:nums.count + 3)
        for i in stride(from: nums.count-1, through: 0, by: -1) {
            dp[i] = max(nums[i] + dp[i+2], nums[i] + dp[i+3])
        }
        return max(dp[0],dp[1])
    }
    
    /// LeetCode: 790. Domino and Tromino Tiling.
    ///
    /// Solved using dynamic programming (Tabulation).
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of columns after tiling.
    func numTilings(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 3)
        dp[0] = 1
        dp[1] = 1
        dp[2] = 2
        for i in stride(from: 3, through: n, by: 1) {
            dp[i] = (dp[i-1] * 2 + dp[i-3]) % 1000000007
        }
        return dp[n]
    }
    
    /// LeetCode: 62. Unique Paths.
    ///
    /// Solved using dynamic programming (Memoization).
    ///
    /// - Complexity: Time complexity is O(*m*n*) and space complexity is O(*m*n*), where *m* is the number of rows and *n* is the number of columns.
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating:Array(repeating:0, count:n), count:m)
        func move(_ r: Int, _ c: Int) -> Int {
            if r >= m || c >= n {
                return 0
            }
            if r == m-1 && c == n-1 {
                return 1
            }
            if dp[r][c] > 0 {
                return dp[r][c]
            }
            dp[r][c] += move(r+1,c)
            dp[r][c] += move(r,c+1)
            return dp[r][c]
        }
        return move(0,0)
    }
    
    /// LeetCode: 1143. Longest Common Subsequence
    ///
    /// Solved using dynamic programming (Memoization).
    ///
    /// - Complexity: Time complexity is O(*m*n*) and space complexity is O(*m*n*), where *m* is the length of `text1` and *n* is the length of `text2`.
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        let text1 = Array(text1)
        let text2 = Array(text2)
        let m = text1.count
        let n = text2.count
        var dp = Array(repeating:Array(repeating:-1, count:n), count:m)
        func lcs(_ idx1: Int, _ idx2: Int) -> Int {
            if idx1 >= m || idx2 >= n {
                return 0
            }
            if dp[idx1][idx2] >= 0 {
                return dp[idx1][idx2]
            }
            if text1[idx1] == text2[idx2] {
                dp[idx1][idx2] = 1 + lcs(idx1+1,idx2+1)
                return dp[idx1][idx2]
            }
            dp[idx1][idx2] = max(lcs(idx1,idx2+1), lcs(idx1+1,idx2))
            return dp[idx1][idx2]
        }
        return lcs(0,0)
    }
    
    /// LeetCode: 714. Best Time to Buy and Sell Stock with Transaction Fee.
    ///
    /// Solved using dynamic programming (Memoization).
    ///
    /// - Complexity: Time complexity is O(*2^n*) without memoization and space complexity is O(*n*), where *n* is the total number of days.
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        let n = prices.count
        var dp = Array(repeating:Array(repeating:Int.min, count:2), count:n)
        func mp(_ day: Int, _ buy: Int) -> Int {
            if day == n {
                return 0
            }
            if dp[day][buy] != Int.min {
                return dp[day][buy]
            }
            if buy == 1 {
                dp[day][buy] = max(-prices[day] + mp(day + 1, 0), mp(day + 1, 1))
            }
            else {
                dp[day][buy] = max(prices[day] - fee + mp(day + 1, 1), mp(day + 1, 0))
            }
            return dp[day][buy]
        }
        return mp(0, 1)
    }
    
    /// LeetCode: 72. Edit Distance.
    ///
    /// Solved using dynamic programming (Memoization).
    ///
    /// - Complexity: Time complexity is O(??) and space complexity is O(*m*n*), where *m* is the length of `word1` and  *n* is the length of `word2`.
    func minDistance(_ word1: String, _ word2: String) -> Int {
        let word1 = Array(word1)
        let word2 = Array(word2)
        let m = word1.count
        let n = word2.count
        var dp = Array(repeating: Array(repeating: -1, count: n), count: m)
        func md(_ i: Int, _ j: Int) -> Int {
            if i == m {
                return n - j // Insert remaining characters in word2
            }
            else if j == n {
                return m - i // Delete remaining characters in word1
            }
            if dp[i][j] != -1 {
                return dp[i][j]
            }
            if word1[i] == word2[j] {
                dp[i][j] = md(i+1, j+1) // no operation
            }
            else {
                let ins = 1 + md(i, j+1) // insert operation
                let del = 1 + md(i+1, j) // delete operation
                let rep = 1 + md(i+1, j+1) // replace operation
                dp[i][j] = min(ins,del,rep)
            }
            return dp[i][j]
        }
        return md(0, 0)
    }
    
    /// LeetCode: 72. Edit Distance.
    ///
    /// Solved using dynamic programming (Tabulation).
    ///
    /// - Complexity: Time complexity is O(*m*n*) and space complexity is O(*m*n*), where *m* is the length of `word1` and  *n* is the length of `word2`.
    func minDistance_tabulation(_ word1: String, _ word2: String) -> Int {
        let word1 = Array(word1)
        let word2 = Array(word2)
        let m = word1.count
        let n = word2.count
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        for i in 0...m {
            for j in 0...n {
                if i == 0 || j == 0 {
                    dp[i][j] = i + j
                }
                else if word1[i-1] == word2[j-1] {
                    dp[i][j] = dp[i-1][j-1]
                }
                else {
                    dp[i][j] = 1 + min(dp[i][j-1], dp[i-1][j], dp[i-1][j-1])
                }
            }
        }
        return dp[m][n]
    }
    
    /// LeetCode: 118. Pascal's Triangle
    ///
    /// Solved using dynamic programming.
    ///
    /// - Complexity: Time complexity is O(*n^2*) and space complexity is O(*n*), where *n* is `numRows`.
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 1 {
            return [[1]]
        }
        var ans: [[Int]] = [[1],[1,1]]
        for r in 2..<numRows {
            var row = Array(repeating:1, count:r+1)
            for c in 1..<r {
                row[c] = ans[r-1][c-1] + ans[r-1][c]
            }
            ans.append(row)
        }
        return ans
    }
    
        
}
