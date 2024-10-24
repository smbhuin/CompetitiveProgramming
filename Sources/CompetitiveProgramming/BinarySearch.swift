import Foundation

public class BinarySearchSolution : Solution {
    
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
    
    /// LeetCode: 704. Binary Search.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*logn*), where *n* is the size of the array `nums`. Space complexity is O(1), only constant extra space is used.
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] < target {
                left = mid + 1
            }
            else if nums[mid] > target {
                right = mid - 1
            }
            else {
                return mid
            }
        }
        return -1
    }
    
    /// LeetCode: 744. Find Smallest Letter Greater Than Target.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*logn*), where *n* is the size of the array `letters`. Space complexity is O(1), only constant extra space is used.
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var left = 0, right = letters.count - 1, ans = letters[0]
        while left <= right {
            let mid = (left + right) / 2
            if letters[mid] > target {
                ans = letters[mid]
                right = mid - 1
            }
            else {
                left = mid + 1
            }
        }
        return ans
    }
    
    /// LeetCode: 1351. Count Negative Numbers in a Sorted Matrix.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*m+n*), where *m* and *n* is the number of rows & columns in the matrix `grid` respectively. Space complexity is O(1), only constant extra space is used.
    func countNegatives(_ grid: [[Int]]) -> Int {
        let m = grid.count, n = grid[0].count
        var r = 0, ans = 0
        while r < m {
            // Find first negative number in the row using binary search.
            var left = 0, right = n - 1, c = 0
            while left <= right {
                let mid = (left + right) / 2
                if grid[r][mid] < 0 {
                    c = n - mid // negative count
                    right = mid - 1
                }
                else {
                    left = mid + 1
                }
            }
            ans += c
            r += 1
        }
        return ans
    }
    
    /// LeetCode: 436. Find Right Interval.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*nlogn*) and space complexity is O(*n*), where *n* is the number of intervals.
    func findRightInterval(_ intervals: [[Int]]) -> [Int] {
        let n = intervals.count
        var indexedIntervals = intervals.enumerated().map { [$1[0],$1[1],$0] } // [start_i, end_i, i]
        indexedIntervals.sort(by: { $0[0] < $1[0] })
        var ans = Array(repeating: -1, count: n)
        for i in 0..<n {
            var left = 0, right = n - 1, idx = -1
            while left <= right {
                let mid = (left + right) / 2
                if indexedIntervals[mid][0] >= intervals[i][1] {
                    idx = indexedIntervals[mid][2]
                    right = mid - 1
                }
                else {
                    left = mid + 1
                }
            }
            ans[i] = idx
        }
        return ans
    }
    
    /// LeetCode: 153. Find Minimum in Rotated Sorted Array.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*log n*), where *n* is the length of nums array. Space complexity is O(1), only constant extra space is used.
    func findMin(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        while start < end  {
            let mid = (start + end) / 2
            if nums[mid] > nums[end] {
                start = mid + 1
            }
            else {
                end = mid
            }
        }
        return nums[end]
    }
    
    /// LeetCode: 154. Find Minimum in Rotated Sorted Array II.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*log n*), where *n* is the length of nums array. Space complexity is O(1), only constant extra space is used.
    func findMinII(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        while start < end  {
            let mid = (start + end) / 2
            if nums[mid] > nums[end] {
                start = mid + 1
            }
            else if nums[mid] == nums[end] {
                end -= 1
            }
            else {
                end = mid
            }
        }
        return nums[end]
    }
    
}

/// LeetCode: 981. Time Based Key-Value Store.
///
/// Solved using binary search.
///
class TimeMap {

    var dict: [String:[(Int,String)]]
    
    init() {
        dict = [:]
    }
    
    /// - Complexity: Time complexity is O(*logn*), where *n* is the number of values. Space complexity is O(1), only constant extra space is used.
    func findIndex(_ values: [(Int,String)], _ timestamp: Int) -> Int {
        var left = 0, right = values.count - 1, idx = -1
        while left <= right {
            let mid = (left + right) / 2
            if values[mid].0 <= timestamp {
                idx = mid
                left = mid + 1
            }
            else {
                right = mid - 1
            }
        }
        return idx
    }
    
    /// - Complexity: Time complexity is O(1) and space complexity is O(1), only constant extra space is used.
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        dict[key, default: []].append((timestamp,value))
    }
    
    /// - Complexity: Time complexity is O(*logn*), where *n* is the number of stored values for a particular key. Space complexity is O(1), only constant extra space is used.
    func get(_ key: String, _ timestamp: Int) -> String {
        if let vals = dict[key] {
            let idx = findIndex(vals, timestamp)
            if idx != -1 {
                return vals[idx].1
            }
        }
        return ""
    }
}

/// LeetCode: 1146. Snapshot Array.
///
/// Solved using binary search.
///
class SnapshotArray {

    var arr: [[(Int,Int)]] // [[(snapId,value)]]
    var snapId: Int

    init(_ length: Int) {
        arr = Array(repeating: [(0,0)], count: length) // SC: O(length * snaps)
        snapId = 0
    }
    
    /// - Complexity: Time complexity and space complexity is O(1).
    func set(_ index: Int, _ val: Int) {
        arr[index].append((snapId,val))
    }
    
    /// - Complexity: Time complexity and space complexity is O(1).
    @discardableResult
    func snap() -> Int {
        snapId += 1
        return snapId - 1
    }
    
    /// - Complexity: Time complexity is O(*logn*), where *n* is the number of snap Ids. Space complexity is O(1), only constant extra space is used.
    func get(_ index: Int, _ snap_id: Int) -> Int {
        let snaps = arr[index]
        var left = 0, right = snaps.count - 1, val = 0
        while left <= right {
            let mid = (left + right) / 2
            if snaps[mid].0 <= snap_id {
                val = snaps[mid].1
                left = mid + 1
            }
            else {
                right = mid - 1
            }
        }
        return val
    }
    
}
