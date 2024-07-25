
public extension Solution {
    
    /// LeetCode: 2215. Find the Difference of Two Arrays.
    ///
    /// Solved using HashSet
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the size of the array `nums`.  Space complexity is O(1), only constant space is used.
    func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
        let nums1 = Set(nums1)
        let nums2 = Set(nums2)
        var ans1: [Int] = []
        var ans2: [Int] = []
        for num in nums1 {
            if !nums2.contains(num) {
                ans1.append(num)
            }
        }
        for num in nums2 {
            if !nums1.contains(num) {
                ans2.append(num)
            }
        }
        return [ans1, ans2]
    }
    
    /// LeetCode: 1207. Unique Number of Occurrences.
    ///
    /// Solved using frequency HashMap.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where n is the size of the array `arr`.
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        var map: [Int:Int] = [:] // frequency map
        for num in arr {
            map[num] = map[num, default:0] + 1
        }
        return map.count == Set(map.values).count
    }
    
}

