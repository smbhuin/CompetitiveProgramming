
public extension Solution {
    
    /// LeetCode: 763. Partition Labels.
    ///
    /// Solved by iteration using greedy method.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the length of the string `s`.
    func partitionLabels(_ s: String) -> [Int] {
        var lastIndex: [Character:Int] = [:]
        var ans: [Int] = []
        let chars = s.enumerated()
        for (index, char) in chars {
            lastIndex[char] = index
        }
        var size = 0, endIndex = 0
        for (index, char) in chars {
            size += 1
            endIndex = max(endIndex, lastIndex[char]!)
            if index == endIndex {
                ans.append(size)
                size = 0
            }
        }
        return ans
    }
    
}

