
public extension Solution {
    
    /// LeetCode: 435. Non-overlapping Intervals.
    ///
    /// Solved using sorting & iteration.
    ///
    /// - Complexity: Time complexity is O(*nlogn*), where n is the size of the array `intervals`. Space complexity is O(1), only constant space is used.
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        let intervals = intervals.sorted(by: { $0[0] < $1[0] })
        var count = 0, i = 0, j = 1, n = intervals.count
        while j < n {
            let pe = intervals[i][1]
            let cs = intervals[j][0]
            let ce = intervals[j][1]
            if pe <= cs { // No Overlap
                i = j
                j += 1
            }
            else { // Overlap
                if pe > ce {
                    i = j
                    j += 1
                }
                else {
                    j += 1
                }
                count += 1
            }
        }
        return count
    }
    
    /// LeetCode: 452. Minimum Number of Arrows to Burst Balloons.
    ///
    /// Solved using sorting & iteration.
    ///
    /// - Complexity: Time complexity is O(*nlogn*), where n is the size of the array `points`. Space complexity is O(1), only constant space is used.
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let points = points.sorted(by: { $0[0] <= $1[0] })
        let n = points.count
        var i = 0
        var count = 0
        while i < n {
            var right = points[i][1]
            while i + 1 < n && points[i + 1][0] <= right {
                i += 1
                right = min(right, points[i][1])
            }
            i += 1
            count += 1
        }
        return count
    }
}
