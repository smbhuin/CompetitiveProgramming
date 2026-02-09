
public class StringSolution : Solution {

    /// LeetCode: 345. Reverse Vowels of a String.
    ///
    /// Solved by iteration using two pointers.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where n is the length of the string.
    func reverseVowels(_ s: String) -> String {
        var arr = Array(s)
        var i = 0, j = arr.count - 1
        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        while i < j {
            let iv = vowels.contains(arr[i])
            let jv = vowels.contains(arr[j])
            if iv && !jv {
                j -= 1
                continue
            }
            if !iv && jv {
                i += 1
                continue
            }
            if iv && jv {
                arr.swapAt(i,j)
            }
            i += 1
            j -= 1
        }
        return String(arr)
    }
    
    /// LeetCode: 8. String to Integer (atoi).
    ///
    /// Solved by iteration.
    ///
    /// - Seealso: [Leetcode 8](https://leetcode.com/problems/string-to-integer-atoi/description/)
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(1), where *n* is the number of chars in the string `s`.
    func myAtoi(_ s: String) -> Int {
        var res = 0
        var foundDigitOrChar = false
        var sign = 1
        let intMax = 2_147_483_647, intMin = -2_147_483_648
        for c in s {
            if c == " " && foundDigitOrChar == false {
                continue
            }
            if c.isNumber {
                foundDigitOrChar = true
                let value = c.wholeNumberValue!
                if res*sign > intMax / 10 || res*sign == intMax / 10 && value*sign > 7 {
                    return intMax
                }
                if res*sign < intMin / 10 || res*sign == intMin / 10 && value*sign < -8 {
                    return intMin
                }
                res = res * 10 + value
            }
            else {
                if foundDigitOrChar {
                    break
                }
                if c == "-" {
                    sign = -1
                }
                foundDigitOrChar = true
            }
        }
        return res * sign
    }
    
    /// HackerRank: Separate the Numbers.
    ///
    /// Solved by iteration.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(1), where *n* is the number of chars in the string `s`.
    func separateNumbers(_ s: String) -> Int {
        let half = s.count / 2
        var res = 0
        if half >= 1 {
            loop1: for i in 1...half {
                var arr = Array(s)
                let start = Int(s.prefix(i))!
                var num = start
                var numArr = Array(String(num))
                loop2: while !arr.isEmpty {
                    if arr.count >= numArr.count {
                        for d in numArr {
                            if d == arr[0] {
                                arr.remove(at: 0)
                            }
                            else {
                                break loop2
                            }
                        }
                    }
                    else {
                        break loop2
                    }
                    if arr.isEmpty {
                        res = start
                        break loop1
                    }
                    num += 1
                    numArr = Array(String(num))
                }
            }
        }
        return res
    }
    
    /// HackerRank: Morgan and a String.
    ///
    /// Solved by iteration.
    ///
    /// - Complexity: Time complexity is O(*n^2*) and space complexity is O(n), where *n* is the number of chars in the string `a+b`.
    func morganAndString(a: String, b: String) -> String {
        let totalLen = a.count + b.count
        var a = a + "z"
        var b = b + "z"
        var chars: [Character] = []
        for _ in 0..<totalLen {
            if a < b {
                chars.append(a.first!)
                a.removeFirst()
            }
            else {
                chars.append(b.first!)
                b.removeFirst()
            }
        }
        return String(chars)
    }

    /// HackerRank: Common Child.
    ///
    /// Solved by iteration.
    ///
    /// - Complexity: Time complexity is O(*n^3*) and space complexity is O(n), where *n* is the number of chars in the string `s1`.
    func commonChild(s1: String, s2: String) -> Int {
        let s1Arr = Array(s1)
        let s2Arr = Array(s2)
        let s1Len = s1Arr.count
        let s2Len = s2Arr.count
        var maxLen = 0
        func solve(_ s1Idx: Int, _ s2Idx: Int, _ count: Int) {
            if s1Idx >= s1Len || s2Idx >= s2Len {
                maxLen = max(maxLen, count)
                return
            }
            for s2p in s2Idx..<s2Len {
                if s1Arr[s1Idx] == s2Arr[s2p] {
                    solve(s1Idx + 1, s2p + 1, count + 1)
                    break
                }
            }
            solve(s1Idx + 1, s2Idx, count)
        }
        solve(0, 0, 0)
        return maxLen
    }
    
    
}


