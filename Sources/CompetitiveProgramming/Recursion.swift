
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
    
}
