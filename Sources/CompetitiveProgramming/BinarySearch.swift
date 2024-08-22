
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
}
