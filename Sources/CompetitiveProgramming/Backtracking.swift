// Backtracking Template
/*
    var result = []
    func backtrack(STATE) {
        if isValidState(STATE) {
            result.append(CopyOf(STATE))
            return
        }
        for candidate in NextCandidatesOf(STATE) {
            STATE.append(candidate)
            backtrack(STATE)
            STATE.removeLast()
        }
    }
    var STATE = []
    backtrack(STATE)
*/

public extension Solution {
    
    /// LeetCode: 17. Letter Combinations of a Phone Number.
    ///
    /// Solved using backtracking DFS.
    ///
    /// - Complexity: Time complexity is O(*4^n*) and space complexity is O(*n*), where *n* is the length of the string `digits`.
    func letterCombinations(_ digits: String) -> [String] {
        let digits = Array(digits)
        let len = digits.count
        guard len > 0 else { return [] }
        let dict: [Character: [String]] = [  // SC: O(1)
            "2":["a","b","c"],
            "3":["d","e","f"],
            "4":["g","h","i"],
            "5":["j","k","l"],
            "6":["m","n","o"],
            "7":["p","q","r","s"],
            "8":["t","u","v"],
            "9":["w","x","y","z"],
        ]
        func dfs(_ index: Int, _ letter: String) -> [String] { // SC: O(n) for the recursion stack
            guard index < len else { return [letter] }
            let digit = digits[index]
            let letters = dict[digit]!
            var res: [String] = []
            for l in letters {
                for r in dfs(index + 1, l) {
                    res.append(letter + r)
                }
            }
            return res
        }
        return dfs(0, "")
    }

}
