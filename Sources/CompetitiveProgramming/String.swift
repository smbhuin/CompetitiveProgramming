
public extension Solution {
    
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
    
    

}

