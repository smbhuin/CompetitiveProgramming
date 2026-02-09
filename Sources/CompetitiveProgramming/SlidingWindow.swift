
// Sliding Window Pattern
/*func fn(_ arr: [Int]) -> Int {
    var left = 0, ans = 0, curr = 0

    for right in 0..<arr.count {
        // do logic here to add arr[right] to curr

        while WINDOW_CONDITION_BROKEN {
            // remove arr[left] from curr
            left += 1
        }
        
        // update ans
    }
    return ans
}*/

public class SlidingWindowSolution : Solution {
    
    /// LeetCode: 643. Maximum Average Subarray I.
    ///
    /// Solved by iteration using sliding window.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the size of the array `nums`.  Space complexity is O(1), only constant space is used.
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var start = 0, end = k, sum = 0.0
        for i in start..<end {
            sum += Double(nums[i])
        }
        var avg = sum / Double(k)
        while end < nums.count {
            sum -= Double(nums[start])
            sum += Double(nums[end])
            start += 1
            end += 1
            avg = max(avg, sum / Double(k))
        }
        return avg
    }
    
    /// LeetCode: 1456. Maximum Number of Vowels in a Substring of Given Length.
    ///
    /// Solved by iteration using sliding window.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the length of the string `s`.  Space complexity is O(1), only constant space is used.
    func maxVowels(_ s: String, _ k: Int) -> Int {
        let str = Array(s)
        var left = 0, curr = 0, ans = 0
        let vowels: Set<Character> = ["a","e","i","o","u"]
        for right in 0..<str.count {
            if vowels.contains(str[right]) {
                curr += 1
            }
            while right - left + 1 > k { // if window size is greater that k
                if vowels.contains(str[left]) {
                    curr -= 1
                }
                left += 1
            }
            ans = max(ans, curr)
        }
        return ans
    }
    
    /// LeetCode: 1004. Max Consecutive Ones III.
    ///
    /// Solved by iteration using sliding window. Eazy to understand.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the size of the array `nums`.  Space complexity is O(1), only constant space is used.
    func longestOnes(_ nums: [Int], _ k: Int) -> Int {
        var left = 0, maxWin = 0, zeros = 0
        for right in 0..<nums.count {
            if nums[right] == 0 {
                zeros += 1
            }
            if zeros > k {
                if nums[left] == 0  {
                    zeros -= 1
                }
                left += 1
            }
            maxWin = max(maxWin, right - left + 1)
        }
        return maxWin
    }
    
    /// LeetCode: 1004. Max Consecutive Ones III.
    ///
    /// Solved by iteration using sliding window. Optimized Approach.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the size of the array `nums`.  Space complexity is O(1), only constant space is used.
    func longestOnesII(_ nums: [Int], _ k: Int) -> Int {
        var left = 0, right = 0, k = k
        while right < nums.count {
            if nums[right] == 0 {
                k -= 1
            }
            if k < 0 {
                if nums[left] == 0 {
                    k += 1
                }
                left += 1
            }
            right += 1
        }
        return right-left
    }
    
    /// LeetCode: 1493. Longest Subarray of 1's After Deleting One Element.
    ///
    /// Solved by iteration using sliding window.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the size of the array `nums`.  Space complexity is O(1), only constant space is used.
    func longestSubarray(_ nums: [Int]) -> Int {
        var left = 0, maxWin = 0, zeros = 0
        for right in 0..<nums.count {
            if nums[right] == 0 {
                zeros += 1
            }
            while zeros > 1 {
                if nums[left] == 0  {
                    zeros -= 1
                }
                left += 1
            }
            maxWin = max(maxWin, right - left) // size is (right - left + 1), but since you must delete one element, its (right - left).
        }
        return maxWin
    }
    
    /// LeetCode: 438. Find All Anagrams in a String.
    ///
    /// Solved by iteration using sliding window.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the length of the string `s`.  Space complexity is O(1), only constant space is used.
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let sarr = Array(s)
        let parr = Array(p)
        guard sarr.count >= parr.count else {
            return []
        }
        var sCount: [Character:Int] = [:]
        var pCount: [Character:Int] = [:]
        for i in 0..<parr.count {
            pCount[parr[i]] = pCount[parr[i], default:0] + 1
            sCount[sarr[i]] = sCount[sarr[i], default:0] + 1
        }
        var ans: [Int] = []
        if sCount == pCount {
            ans.append(0)
        }
        var l = 0
        for r in parr.count..<sarr.count {
            sCount[sarr[r]] = sCount[sarr[r], default: 0] + 1
            sCount[sarr[l]] = sCount[sarr[l], default: 0] - 1
            if sCount[sarr[l], default: 0] == 0 {
                sCount.removeValue(forKey: sarr[l])
            }
            l += 1
            if sCount == pCount {
                ans.append(l)
            }
        }
        return ans
    }
    
    /// LeetCode: 239. Sliding Window Maximum.
    ///
    /// Solved by iteration using sliding window.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the size of the array `nums`.  Space complexity is O(*n*), where *n* is the size of the array `nums`.
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var ans: [Int] = []
        var left = 0, right = 0
        let deque = Queue<Int>() // contains index
        while right < nums.count {
            // Remove indices with smaller values from deque
            while let back = deque.back, nums[back] < nums[right] {
                deque.popBack()
            }
            deque.pushBack(right)
            // Remove left from window
            if left > deque.front! {
                deque.popFront()
            }
            if right + 1 >= k {
                ans.append(nums[deque.front!])
                left += 1
            }
            right += 1
        }
        return ans
    }
    
    /// HackerRank: Bear and Steady Gene.
    ///
    /// Solved by iteration.
    ///
    /// - Complexity: Time complexity is O(*n^2*) and space complexity is O(n), where *n* is the number of chars in the string `gene`.
    func steadyGene(_ gene: String) -> Int {
        var geneArr: [Character] = []
        var counts: [Character:Int] = [:]
        for c in gene {
            geneArr.append(c)
            counts[c, default: 0] += 1
        }
        let expLen = geneArr.count / 4
        if counts.allSatisfy({$0.value <= expLen}) {
            return 0
        }
        var minSub = Int.max
        var left = 0
        for right in 0..<geneArr.count {
            counts[geneArr[right], default: 0] -= 1
            while counts.allSatisfy({$0.value <= expLen}) && left <= right {
                minSub = min(minSub, right - left + 1)
                counts[geneArr[left], default: 0] += 1
                left += 1
            }
        }
        return minSub
    }
    
    /// LeetCode: 187. Repeated DNA Sequences.
    ///
    /// Solved by iteration using sliding window of fixed width 10.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the length of the string `s`.  Space complexity is O(*n*), where *n* is the size of the string `s`.
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        let len = s.count
        if len < 10 {
            return []
        }
        var left = s.startIndex, right = s.index(s.startIndex, offsetBy: 9)
        let end = s.index(before: s.endIndex)
        var counts: [Substring: Int] = [:]
        while right <= end {
            counts[s[left...right], default: 0] += 1
            left = s.index(after: left)
            right = s.index(after: right)
        }
        let result: [String] = counts.compactMap({ $0.value > 1 ? String($0.key) : nil })
        return result
    }
    
    /// LeetCode: 220. Contains Duplicate III.
    ///
    /// Solved by iteration using sliding window.
    ///
    /// - Complexity: ??
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ indexDiff: Int, _ valueDiff: Int) -> Bool {
        for left in 0..<nums.count-1{
            var right = left + 1
            while right < nums.count && abs(left - right) <= indexDiff {
                if abs(nums[left] - nums[right]) <= valueDiff {
                    return true
                }
                right += 1
            }
        }
        return false
    }
    
    /// HackerRank: Subarray Division.
    ///
    /// Solved by iteration.
    ///
    /// - Complexity: Time complexity is O(*n*).  Space complexity is O(1), where *n* is the size of the array `scores`.
    func birthday(_ s: [Int], _ d: Int, _ m: Int) -> Int {
        var counter = 0
        var sum = 0
        for i in 0..<m-1 {
            sum += s[i]
        }
        var left = 0
        for right in (m-1)..<s.count {
            sum += s[right]
            if sum == d {
                counter += 1
            }
            sum -= s[left]
            left += 1
        }
        return counter
    }
    
}
