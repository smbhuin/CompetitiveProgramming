
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
    
    /// HackerRank: Matrix Rotation.
    ///
    /// Solved using layer by layer iteration.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(n), where *n* is the number of elements in the matrix.
    func matrixRotation(_ matrix: [[Int]], _ r: Int) -> [[Int]] {
        let m = matrix.count
        let n = matrix[0].count
        let layerCount = min(m, n) / 2
        var layers: [[Int]] = []
        
        // Create list of layers (read all elements from matrix)
        for l in 0..<layerCount {
            var layer: [Int] = []
            for i in l..<n-1-l {
                layer.append(matrix[l][i])
            }
            for i in l..<m-1-l {
                layer.append(matrix[i][n-1-l])
            }
            for i in stride(from: n-1-l, to: l, by: -1) {
                layer.append(matrix[m-1-l][i])
            }
            for i in stride(from: m-1-l, to: l, by: -1) {
                layer.append(matrix[i][l])
            }
            layers.append(layer)
        }
        
        // Rotate and update the matrix
        var rotated = matrix
        for l in 0..<layerCount {
            let layer = layers[l]
            var idx = r % layer.count
            for i in l..<n-1-l {
                rotated[l][i] = layer[idx]
                idx = (idx + 1) % layer.count
            }
            for i in l..<m-1-l {
                rotated[i][n-1-l] = layer[idx]
                idx = (idx + 1) % layer.count
            }
            for i in stride(from: n-1-l, to: l, by: -1) {
                rotated[m-1-l][i] = layer[idx]
                idx = (idx + 1) % layer.count
            }
            for i in stride(from: m-1-l, to: l, by: -1) {
                rotated[i][l] = layer[idx]
                idx = (idx + 1) % layer.count
            }
        }
        
        return rotated
    }
    
}
