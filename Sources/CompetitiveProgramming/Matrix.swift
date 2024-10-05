
public class MatrixSolution : Solution {
    
    /// LeetCode: 240. Search a 2D Matrix II.
    ///
    /// Solved by iteration and binary search.
    ///
    /// - Complexity: Time complexity is O(*mlogn*), where *m* and *n* is the number of rows and columns in the `matrix` respectively.  Space complexity is O(1), only constant space is used.
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        var t = 0
        while t < m {
            var l = 0, r = n - 1
            while l <= r {
                let mid = (l + r) / 2
                if matrix[t][mid] == target {
                    return true
                }
                if matrix[t][mid] < target {
                    l = mid + 1
                }
                else {
                    r = mid - 1
                }
            }
            t += 1
        }
        return false
    }
    
}
