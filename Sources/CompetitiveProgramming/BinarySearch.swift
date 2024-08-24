import Foundation

public extension Solution {
    
    /// LeetCode: 2300. Successful Pairs of Spells and Potions.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*(n+m)logm*) and space complexity is O(*m*), where *n* is the number of `spells` and *m* is the number of `potions`.
    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        var pairs = Array(repeating: 0, count: spells.count)
        let potions = potions.sorted(by: >) // descending sort: tc = O(mlogm), sc = O(m)
        for i in 0..<spells.count { // O(nlogm)
            var start = 0, end = potions.count - 1
            while start <= end { // O(logm)
                let mid = (start + end) / 2
                if spells[i] * potions[mid] >= success && (mid+1 >= potions.count || spells[i] * potions[mid+1] < success) {
                    pairs[i] += mid + 1
                    break
                }
                if spells[i] * potions[mid] >= success {
                    start = mid + 1
                }
                else {
                    end = mid - 1
                }
            }
        }
        return pairs
    }
    
    /// LeetCode: 162. Find Peak Element
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*logn*), where *n* is the length of `nums` array. Space complexity is O(1), only constant space is used.
    func findPeakElement(_ nums: [Int]) -> Int {
        let len = nums.count
        var start = 0
        var end = len - 1
        while start < end  {
            let mid = (start + end) / 2
            if nums[mid] < nums[mid+1] {
                start = mid + 1
            }
            else {
                end = mid
            }
        }
        return start
    }
    
    /// LeetCode: 875. Koko Eating Bananas.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*nlogn*), where *n* is the length of the `piles` array. Space complexity is O(1), only constant space is used.
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        let maxPile = piles.max()! // O(n)
        var start = 1
        var end = maxPile
        var speed = maxPile
        while start <= end { // O(n * log(maxPile))
            let k = (start + end) / 2
            let x = Int(piles.reduce(0.0, { $0 + ceil(Double($1)/Double(k)) })) // O(n)
            if x <= h {
                speed = min(speed, k)
                end = k - 1
            }
            else {
                start = k + 1
            }
        }
        return speed
    }
    
}
