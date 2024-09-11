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
        var result: [String] = []
        func backtrack(_ index: Int, _ combination: inout String) { // SC: O(n) for the recursion stack
            guard index < len else {
                result.append(String(combination))
                return
            }
            let digit = digits[index]
            let letters = dict[digit]!
            for l in letters {
                combination.append(l)
                backtrack(index + 1, &combination)
                combination.removeLast()
            }
        }
        var combination = ""
        backtrack(0, &combination)
        return result
    }
    
    /// LeetCode: 216. Combination Sum III.
    ///
    /// Solved using backtracking DFS.
    ///
    /// - Complexity: If we have to select *k* numbers from *9* numbers, the total number of combinations will be C(9, k) = 9! / (k! (9 - k)!). So the
    /// time complexity is O(*9! / (k! (9 - k)!)*) and space complexity is O(*k*), where *k* is the count of numbers allowed to select for each combinations.
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var result: [[Int]] = []
        func backtrack(_ num: Int, _ combination: inout [Int], _ sum: Int) {
            if combination.count == k {
                if sum == n {
                    result.append(Array(combination))
                }
                return
            }
            for i in (num + 1)..<10 {
                if sum + i > n { break }
                combination.append(i)
                backtrack(i, &combination, sum + i)
                combination.removeLast()
            }
        }
        var combination: [Int] = []
        backtrack(0, &combination, 0)
        return result
    }
    
    /// LeetCode: 51. N-Queens.
    ///
    /// Solved using backtracking DFS.
    ///
    /// - Complexity: Time complexity is O(*n!*) and space complexity is O(*n^2*), where *n* is the number of queens`.
    func solveNQueens(_ n: Int) -> [[String]] {
        var ans: [[String]] = []
        var board: [[Character]] = Array(repeating:Array(repeating:".", count:n), count:n) // SC: O(n^2)
        func isValidPlace(_ r: Int, _ c: Int) -> Bool { // TC: O(n)
            var i = r - 1, k = 1
            while i >= 0 {
                if board[i][c] == "Q" {
                    return false
                }
                if c+k < n && board[i][c+k] == "Q" {
                    return false
                }
                if c-k >= 0 && board[i][c-k] == "Q" {
                    return false
                }
                k += 1
                i -= 1
            }
            return true
        }
        func backtrack(_ r: Int) {
            if r >= n {
                ans.append(board.map { String($0) })
                return
            }
            for c in 0..<n where isValidPlace(r, c) {
                board[r][c] = "Q"
                backtrack(r+1)
                board[r][c] = "."
            }
        }
        backtrack(0)
        return ans
    }
    
    /// LeetCode: 78. Subsets.
    ///
    /// Solved using backtracking DFS.
    ///
    /// - Complexity: Time complexity is O(*2^n*) and space complexity is O(*n*), where *n* is the size of `nums`.
    func subsets(_ nums: [Int]) -> [[Int]] {
        var subset: [Int] = []
        var ans: [[Int]] = []
        func backtrack(_ index: Int) {
            ans.append(Array(subset))
            for i in index..<nums.count {
                subset.append(nums[i])
                backtrack(i+1)
                subset.removeLast()
            }
        }
        backtrack(0)
        return ans
    }

}
