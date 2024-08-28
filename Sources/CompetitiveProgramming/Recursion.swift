
public extension Solution {
    
    /// LeetCode: 7198. House Robber.
    ///
    /// Solved using recursion.
    ///
    /// - Complexity: Time complexity is O(*n^2*) and space complexity is O(*n*), where *n* is the number of houses.
    func rob_recursion(_ nums: [Int]) -> Int {
        var money = 0
        func robHouse(_ index: Int, _ sum: Int) {
            if index >= nums.count - 2 {
                money = max(money, sum)
                return
            }
            for i in stride(from: index + 2, to: nums.count, by: 1) {
                robHouse(i, sum + nums[i])
            }
        }
        robHouse(-2, 0)
        return money
    }
    
    /// LeetCode: 790. Domino and Tromino Tiling.
    ///
    /// Solved using recursion.
    ///
    /// - Complexity: Time complexity is O(*n^2*) and space complexity is O(*n*), where *n* is the number of houses.
    func numTilings_recursion(_ n: Int) -> Int {
        var ways = 0
        func solve(_ column: Int) {
            if column >= n {
                if column == n { ways += 1 }
                return
            }
            solve(column + 1)
            solve(column + 2)
            for i in stride(from: 3, through: n, by: 1) {
                solve(column + i)
                solve(column + i)
            }
        }
        solve(0)
        return ways
    }
}
