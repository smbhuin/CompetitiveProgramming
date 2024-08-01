import XCTest
@testable import CompetitiveProgramming

final class CompetitiveProgrammingTests: XCTestCase {
    let sol = Solution()
    
    // MARK: String
    
    func testReverseVowels1() throws {
        XCTAssert(sol.reverseVowels("Hello") == "Holle")
    }
    
    func testReverseVowels2() throws {
        XCTAssert(sol.reverseVowels("leetcode") == "leotcede")
    }
    
    // MARK: Array
    
    func testProductExceptSelf1() throws {
        XCTAssert(sol.productExceptSelf([1,2,3,4]) == [24,12,8,6])
    }
    
    func testProductExceptSelf2() throws {
        XCTAssert(sol.productExceptSelf([-1,1,0,-3,3]) == [0,0,9,0,0])
    }
    
    func testIncreasingTriplet1() throws {
        XCTAssert(sol.increasingTriplet([1,2,3,4,5]) == true)
    }
    
    func testIncreasingTriplet2() throws {
        XCTAssert(sol.increasingTriplet([5,4,3,2,1]) == false)
    }
    
    func testIncreasingTriplet3() throws {
        XCTAssert(sol.increasingTriplet([2,1,5,0,4,6]) == true)
    }
    
    func testIncreasingTriplet4() throws {
        XCTAssert(sol.increasingTriplet([20,100,10,12,5,13]) == true)
    }
    
    func testCompress1() throws {
        var chars: [Character] = ["a","a","b","b","c","c","c"]
        XCTAssert(sol.compress(&chars) == 6)
        XCTAssert(Array(chars[0..<6]) == ["a","2","b","2","c","3"])
    }
    
    func testCompress() throws {
        var chars: [Character] = ["a"]
        XCTAssert(sol.compress(&chars) == 1)
        XCTAssert(Array(chars[0..<1]) == ["a"])
    }
    
    func testCompress3() throws {
        var chars: [Character] = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
        XCTAssert(sol.compress(&chars) == 4)
        XCTAssert(Array(chars[0..<4]) == ["a","b","1","2"])
    }
    
    // MARK: Two Pointers
    
    func testMoveZeroes1() throws {
        var nums: [Int] = [0,1,0,3,12]
        sol.moveZeroesIII(&nums)
        XCTAssert(nums == [1,3,12,0,0])
    }
    
    func testMoveZeroes2() throws {
        var nums: [Int] = [0]
        sol.moveZeroesIII(&nums)
        XCTAssert(nums == [0])
    }
    
    func testMoveZeroes3() throws {
        var nums: [Int] = [-4,1,-34,0,1]
        sol.moveZeroesIII(&nums)
        XCTAssert(nums == [-4,1,-34,1,0])
    }
    
    func testIsSubsequence1() throws {
        XCTAssert(sol.isSubsequence("abc","ahbgdc") == true)
    }
    
    func testIsSubsequence2() throws {
        XCTAssert(sol.isSubsequence("axc","ahbgdc") == false)
    }
    
    func testMaxArea1() throws {
        XCTAssert(sol.maxArea([1,8,6,2,5,4,8,3,7]) == 49)
    }
    
    func testMaxArea2() throws {
        XCTAssert(sol.maxArea([1,1]) == 1)
    }
    
    func testMaxOperations1() throws {
        XCTAssert(sol.maxOperationsI([1,2,3,4], 5) == 2)
    }
    
    func testMaxOperations2() throws {
        XCTAssert(sol.maxOperationsI([3,1,3,4,3], 6) == 1)
    }
    
    func testMaxOperations3() throws {
        XCTAssert(sol.maxOperationsII([7,5,9,4,10], 13) == 1)
    }
    
    // MARK: Sliding Window
    
    func testFindMaxAverage1() throws {
        XCTAssert(sol.findMaxAverage([1,12,-5,-6,50,3], 4) == 12.75)
    }
    
    func testFindMaxAverage2() throws {
        XCTAssert(sol.findMaxAverage([5], 1) == 5.0)
    }
    
    func testMaxVowels1() throws {
        XCTAssert(sol.maxVowels("abciiidef", 3) == 3)
    }
    
    func testMaxVowels2() throws {
        XCTAssert(sol.maxVowels("aeiou", 2) == 2)
    }
    
    func testMaxVowels3() throws {
        XCTAssert(sol.maxVowels("leetcode", 3) == 2)
    }
    
    func testLongestOnes1() throws {
        XCTAssert(sol.longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2) == 6)
    }
    
    func testLongestOnes2() throws {
        XCTAssert(sol.longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3) == 10)
    }
    
    func testLongestOnesOpt1() throws {
        XCTAssert(sol.longestOnesII([1,1,1,0,0,0,1,1,1,1,0], 2) == 6)
    }
    
    func testLongestOnesOpt2() throws {
        XCTAssert(sol.longestOnesII([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3) == 10)
    }
    
    func testLongestSubarray1() throws {
        XCTAssert(sol.longestSubarray([1,1,0,1]) == 3)
    }
    
    func testLongestSubarray2() throws {
        XCTAssert(sol.longestSubarray([0,1,1,1,0,1,1,0,1]) == 5)
    }
    
    func testLongestSubarray3() throws {
        XCTAssert(sol.longestSubarray([1,1,1]) == 2)
    }
    
    // MARK: Prefix Sum
    
    func testLargestAltitude1() throws {
        XCTAssert(sol.largestAltitude([-5,1,5,0,-7]) == 1)
    }
    
    func testLargestAltitude2() throws {
        XCTAssert(sol.largestAltitude([-4,-3,-2,-1,4,3,2]) == 0)
    }
    
    func testPivotIndex1() throws {
        XCTAssert(sol.pivotIndex([1,7,3,6,5,6]) == 3)
    }
    
    func testPivotIndex2() throws {
        XCTAssert(sol.pivotIndex([1,2,3]) == -1)
    }
    
    func testPivotIndex3() throws {
        XCTAssert(sol.pivotIndex([2,1,-1]) == 0)
    }
    
    // MARK: HashMap & HashSet
    
    func testFindDifference1() throws {
        let result = sol.findDifference([1,2,3],[2,4,6])
        XCTAssert(Set(result[0]) == Set([1,3]))
        XCTAssert(Set(result[1]) == Set([4,6]))
    }
    
    func testFindDifference2() throws {
        let result = sol.findDifference([1,2,3,3],[1,1,2,2])
        XCTAssert(Set(result[0]) == Set([3]))
        XCTAssert(Set(result[1]) == Set([]))
    }
    
    func testUniqueOccurrences1() throws {
        XCTAssert(sol.uniqueOccurrences([1,2,2,1,1,3]) == true)
    }
    
    func testUniqueOccurrences2() throws {
        XCTAssert(sol.uniqueOccurrences([1,2]) == false)
    }
    
    func testUniqueOccurrences3() throws {
        XCTAssert(sol.uniqueOccurrences([-3,0,1,-3,1,1,1,-3,10,0]) == true)
    }
    
    func testCloseStrings1() throws {
        XCTAssert(sol.closeStrings("abc", "bca") == true)
    }
    
    func testCloseStrings2() throws {
        XCTAssert(sol.closeStrings("a", "aa") == false)
    }
    
    func testCloseStrings3() throws {
        XCTAssert(sol.closeStrings("cabbba", "abbccc") == true)
    }
    
    func testCloseStrings4() throws {
        XCTAssert(sol.closeStrings("uau", "ssx") == false)
    }
    
    func testCloseStrings5() throws {
        XCTAssert(sol.closeStrings("aaabbbbccddeeeeefffff", "aaaaabbcccdddeeeeffff") == false)
    }
    
    func testEqualPairs1() throws {
        XCTAssert(sol.equalPairs([[3,2,1],[1,7,6],[2,7,7]]) == 1)
    }
    
    func testEqualPairs2() throws {
        XCTAssert(sol.equalPairs([[3,1,2,2],[1,4,4,5],[2,4,2,2],[2,4,2,2]]) == 3)
    }
    
    func testEqualPairs3() throws {
        XCTAssert(sol.equalPairs([[3,1,2,2],[1,4,4,4],[2,4,2,2],[2,5,2,2]]) == 3)
    }
    
    func testEqualPairs4() throws {
        XCTAssert(sol.equalPairs([[11,1],[1,11]]) == 2)
    }
    
    // MARK: Stack
    
    func testRemoveStars1() throws {
        XCTAssert(sol.removeStars("leet**cod*e") == "lecoe")
    }
    
    func testRemoveStars2() throws {
        XCTAssert(sol.removeStars("erase*****") == "")
    }
    
    func testAsteroidCollision1() throws {
        XCTAssert(sol.asteroidCollision([5,10,-5]) == [5,10])
    }
    
    func testAsteroidCollision2() throws {
        XCTAssert(sol.asteroidCollision([8,-8]) == [])
    }
    
    func testAsteroidCollision3() throws {
        XCTAssert(sol.asteroidCollision([10,2,-5]) == [10])
    }
    
    func testAsteroidCollision4() throws {
        XCTAssert(sol.asteroidCollision([5,8,-4]) == [5,8])
    }
    
    func testAsteroidCollision5() throws {
        XCTAssert(sol.asteroidCollision([-2,-2,1,-1]) == [-2,-2])
    }
    
    func testAsteroidCollision6() throws {
        XCTAssert(sol.asteroidCollision([1,-2,-2,-2]) == [-2,-2,-2])
    }
    
    func testDecodeString1() throws {
        XCTAssert(sol.decodeString("3[a]2[bc]") == "aaabcbc")
    }
    
    func testDecodeString2() throws {
        XCTAssert(sol.decodeString("3[a2[c]]") == "accaccacc")
    }
    
    func testDecodeString3() throws {
        XCTAssert(sol.decodeString("2[abc]3[cd]ef") == "abcabccdcdcdef")
    }
    
    func testDecodeString4() throws {
        XCTAssert(sol.decodeString("3[z]2[2[y]pq4[2[jk]e1[f]]]ef") == "zzzyypqjkjkefjkjkefjkjkefjkjkefyypqjkjkefjkjkefjkjkefjkjkefef")
    }
    
    // MARK: - Queue
    
    func testRecentCounter1() throws {
        let counter = RecentCounter()
        XCTAssert(counter.ping(1) == 1)
        XCTAssert(counter.ping(100) == 2)
        XCTAssert(counter.ping(3001) == 3)
        XCTAssert(counter.ping(3002) == 3)
    }
    
    func testPredictPartyVictory1() throws {
        XCTAssert(sol.predictPartyVictory("RD") == "Radiant")
    }
    
    func testPredictPartyVictory2() throws {
        XCTAssert(sol.predictPartyVictory("RDD") == "Dire")
    }
    
    func testPredictPartyVictory3() throws {
        XCTAssert(sol.predictPartyVictory("RRR") == "Radiant")
    }
    
    func testPredictPartyVictory4() throws {
        XCTAssert(sol.predictPartyVictory("RDR") == "Radiant")
    }
    
    // MARK: - Linked List
    
    func testDeleteMiddle1() throws {
        let head = ListNode.buildLinkedList([1,3,4,7,1,2,6])
        let result = sol.deleteMiddle(head)?.allElements()
        XCTAssert(result == [1,3,4,1,2,6])
    }
    
    func testDeleteMiddle2() throws {
        let head = ListNode.buildLinkedList([1,2,3,4])
        let result = sol.deleteMiddle(head)?.allElements()
        XCTAssert(result == [1,2,4])
    }
    
    func testDeleteMiddle3() throws {
        let head = ListNode.buildLinkedList([2,1])
        let result = sol.deleteMiddle(head)?.allElements()
        XCTAssert(result == [2])
    }
    
    func testOddEvenList1() throws {
        let head = ListNode.buildLinkedList([1,2,3,4,5])
        let result = sol.oddEvenList(head)?.allElements()
        XCTAssert(result == [1,3,5,2,4])
    }
    
    func testOddEvenList2() throws {
        let head = ListNode.buildLinkedList([2,1,3,5,6,4,7])
        let result = sol.oddEvenList(head)?.allElements()
        XCTAssert(result == [2,3,6,7,1,5,4])
    }
}


