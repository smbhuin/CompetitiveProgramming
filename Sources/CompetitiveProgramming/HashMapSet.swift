
public class HashingSolution : Solution {
    
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
    
    /// LeetCode: 1657. Determine if Two Strings Are Close.
    ///
    /// Solved using frequency HashMap.
    ///
    /// - Complexity: Time complexity is O(*nlogn+ mlogm*) and space complexity is O(*n+m*), where m is the length of the string `word1` and n is the length of the string `word2`.
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        var map1: [Character:Int] = [:] // frequency map
        var map2: [Character:Int] = [:] // frequency map
        for ch in word1 {
            map1[ch] = map1[ch, default:0] + 1
        }
        for ch in word2 {
            map2[ch] = map2[ch, default:0] + 1
        }
        if map1.count != map2.count {
            return false
        }
        return Set(map1.keys) == Set(map2.keys) && map1.values.sorted() == map2.values.sorted()
    }
    
    /// LeetCode: 1657. Determine if Two Strings Are Close.
    ///
    /// Solved using frequency Array. Faster solution.
    ///
    /// - Complexity: Time complexity is O(*nlogn+ mlogm*), where m is the length of the string `word1` and n is the length of the string `word2`. Space complexity is O(1), only constant space is used.
    func closeStringsII(_ word1: String, _ word2: String) -> Bool {
        var freq1 = Array(repeating: 0, count: 26)
        var freq2 = Array(repeating: 0, count: 26)
        let a = "a".first!.asciiValue!
        for ch in word1 {
            freq1[Int(ch.asciiValue! - a)] += 1
        }
        for ch in word2 {
            freq2[Int(ch.asciiValue! - a)] += 1
        }
        for i in 0..<26 {
            if (freq1[i] == 0 && freq2[i] != 0) || (freq1[i] != 0 && freq2[i] == 0) {
                return false
            }
        }
        freq1.sort()
        freq2.sort()
        return freq1 == freq2
    }
    
    /// LeetCode: 2352. Equal Row and Column Pairs.
    ///
    /// Solved using frequency HashMap of rows and columns.
    ///
    /// - Complexity: Time complexity is O(*n^2*) and space complexity is O(*n^2*), where n is the number of rows/columns of the `grid`.
    func equalPairs(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var map1: [Int:Int] = [:]
        var map2: [Int:Int] = [:]
        for i in 0..<n {
            var r: [Int] = [], c: [Int] = []
            for j in 0..<n {
                r.append(grid[i][j])
                c.append(grid[j][i])
            }
            let rHash = r.hashValue
            let cHash = c.hashValue
            map1[rHash] = map1[rHash, default:0] + 1
            map2[cHash] = map2[cHash, default:0] + 1
        }
        var count = 0
        for (k1, v1) in map1 {
            if let v2 = map2[k1] {
                count += v1 * v2
            }
        }
        return count
    }
    
}

