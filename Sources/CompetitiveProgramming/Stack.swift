public extension Solution {
    
    /// LeetCode: 390. Removing Stars From a String.
    ///
    /// Solved using stack.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the length of the string `s`.  Space complexity is O(*n*), where n is the length of the string `s`.
    func removeStars(_ s: String) -> String {
        var ans: [Character] = [] // acts like stack
        for c in s {
            if c == "*" {
                ans.removeLast()
            }
            else {
                ans.append(c)
            }
        }
        return String(ans)
    }
    
}

