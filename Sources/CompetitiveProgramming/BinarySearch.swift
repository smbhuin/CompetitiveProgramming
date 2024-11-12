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
    
    /// LeetCode: 367. Valid Perfect Square.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*log n*), where *n* is the `num`. Space complexity is O(1), only constant extra space is used.
    func isPerfectSquare(_ num: Int) -> Bool {
        var start = 0, end = num
        while start <= end {
            let mid = (start + end) / 2
            if mid * mid == num {
                return true
            }
            else if mid * mid < num {
                start = mid + 1
            }
            else {
                end = mid - 1
            }
        }
        return false
    }
    
    /// LeetCode: 441. Arranging Coins.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*log n*), where *n* is the number of coins given. Space complexity is O(1), only constant extra space is used.
    func arrangeCoins(_ n: Int) -> Int {
        var start = 0, end = n
        while start <= end {
            let mid = (start + end) / 2
            let coins = mid * (mid + 1) / 2
            if coins <= n {
                start = mid + 1
            }
            else {
                end = mid - 1
            }
        }
        return start - 1
    }
    
    /// LeetCode: 275. H-Index II.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*log n*), where *n* is the number of papers. Space complexity is O(1), only constant extra space is used.
    func hIndex(_ citations: [Int]) -> Int {
        var low = 0, high = citations.count - 1, hidx = 0
        while low <= high {
            let mid = (low + high) / 2
            let topPapers = citations.count - mid
            if citations[mid] >= topPapers {
                hidx = topPapers
                high = mid - 1
            }
            else {
                low = mid + 1
            }
        }
        return hidx
    }
    
    /// LeetCode: 540. Single Element in a Sorted Array.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*log n*), where *n* is the size of `nums`. Space complexity is O(1), only constant extra space is used.
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        let n = nums.count
        var left = 0, right = n - 1
        while left < right {
            let mid = (left + right) / 2
            let isRightEven = (right - mid) % 2 == 0
            if nums[mid] == nums[mid + 1] {
                if isRightEven {
                    left = mid + 2
                }
                else {
                    right = mid - 1
                }
            }
            else {
                if isRightEven {
                    right = mid
                }
                else {
                    left = mid + 1
                }
            }
        }
        return nums[right]
    }
    
    /// LeetCode: 852. Peak Index in a Mountain Array.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*log n*), where *n* is the size of `arr`. Space complexity is O(1), only constant extra space is used.
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var low = 0, high = arr.count - 1
        while low < high {
            let mid = (low + high) / 2
            if arr[mid] < arr[mid+1] {
                low = mid + 1
            }
            else {
                high = mid
            }
        }
        return high
    }
    
    /// LeetCode: 658. Find K Closest Elements.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*log(n) + k*), where *n* is the size of the array `arr`. Space complexity is O(1), only constant extra space is used.
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        var left  = 0, right = arr.count - k
        while left < right {
            let mid = (left + right) / 2
            if x - arr[mid] > arr[mid+k] - x {
                left = mid + 1
            }
            else {
                right = mid
            }
        }
        return Array(arr[left..<left+k])
    }
    
    /// LeetCode: 611. Valid Triangle Number.
    ///
    /// Solved using binary search.
    ///
    /// - Complexity: Time complexity is O(*n^2*) and space complexity is O(*n*), where *n* is the size of the array `nums`.
    func triangleNumber(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else { return 0 }
        let nums = nums.sorted()
        var count = 0
        for k in 2..<nums.count {
            var left = 0, right = k - 1
            while left < right {
                if nums[left] + nums[right] > nums[k] {
                    count += right - left
                    right -= 1
                }
                else {
                    left += 1
                }
            }
        }
        return count
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

/// LeetCode: 528. Random Pick with Weight.
///
/// Solved using sorting and two pointers.
///
class RandomWeightedPick {
    var prefixSum: [Int]
    
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the size of the array `w`.
    init(_ w: [Int]) {
        prefixSum = Array(repeating: 0, count: w.count)
        prefixSum[0] = w[0]
        for i in 1..<w.count {
            prefixSum[i] += prefixSum[i-1] + w[i]
        }
    }
    
    /// - Complexity: Time complexity is O(*logn*), where *n* is the size of the array `prefixSum`. Space complexity is O(1).
    func pickIndex() -> Int {
        let randWeight = Int.random(in: 1...prefixSum.last!)
        var left = 0, right = prefixSum.count - 1
        while left < right {
            let mid = (left + right) / 2
            if prefixSum[mid] < randWeight {
                left = mid + 1
            }
            else {
                right = mid
            }
        }
        return left
    }
}
