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
    
    func testReverseList1() throws {
        let head = ListNode.buildLinkedList([1,2,3,4,5])
        let result = sol.reverseList(head)?.allElements()
        XCTAssert(result == [5,4,3,2,1])
    }
    
    func testReverseList2() throws {
        let head = ListNode.buildLinkedList([1,2])
        let result = sol.reverseList(head)?.allElements()
        XCTAssert(result == [2,1])
    }
    
    func testReverseList3() throws {
        let result = sol.reverseList(nil)
        XCTAssert(result == nil)
    }
    
    func testPairSum1() throws {
        let head = ListNode.buildLinkedList([5,4,2,1])
        let result = sol.pairSum(head)
        XCTAssert(result == 6)
    }
    
    func testPairSum2() throws {
        let head = ListNode.buildLinkedList([4,2,2,3])
        let result = sol.pairSum(head)
        XCTAssert(result == 7)
    }
    
    func testPairSum3() throws {
        let head = ListNode.buildLinkedList([1,100000])
        let result = sol.pairSum(head)
        XCTAssert(result == 100001)
    }
    
    // MARK: - Binary Tree
    
    func testMaxDepth1() throws {
        let root = TreeNode.buildTree([3,9,20,nil,nil,15,7])
        let result = sol.maxDepth(root)
        XCTAssert(result == 3)
    }
    
    func testMaxDepth2() throws {
        let root = TreeNode.buildTree([1,nil,2])
        let result = sol.maxDepth(root)
        XCTAssert(result == 2)
    }
    
    func testMaxDepth3() throws {
        let root = TreeNode.buildTree([])
        let result = sol.maxDepth(root)
        XCTAssert(result == 0)
    }
    
    func testLeafSimilar1() throws {
        let root1 = TreeNode.buildTree([3,5,1,6,2,9,8,nil,nil,7,4])
        let root2 = TreeNode.buildTree([3,5,1,6,7,4,2,nil,nil,nil,nil,nil,nil,9,8])
        let result = sol.leafSimilar(root1,root2)
        XCTAssert(result == true)
    }
    
    func testLeafSimilar2() throws {
        let root1 = TreeNode.buildTree([1,2,3])
        let root2 = TreeNode.buildTree([1,3,2])
        let result = sol.leafSimilar(root1,root2)
        XCTAssert(result == false)
    }
    
    func testGoodNodes1() throws {
        let root = TreeNode.buildTree([3,1,4,3,nil,1,5])
        let result = sol.goodNodes(root)
        XCTAssert(result == 4)
    }
    
    func testGoodNodes2() throws {
        let root = TreeNode.buildTree([3,3,nil,4,2])
        let result = sol.goodNodes(root)
        XCTAssert(result == 3)
    }
    
    func testGoodNodes3() throws {
        let root = TreeNode.buildTree([1])
        let result = sol.goodNodes(root)
        XCTAssert(result == 1)
    }
    
    func testPathSum1() throws {
        let root = TreeNode.buildTree([10,5,-3,3,2,nil,11,3,-2,nil,1])
        let result = sol.pathSum(root, 8)
        XCTAssert(result == 3)
    }
    
    func testPathSum2() throws {
        let root = TreeNode.buildTree([5,4,8,11,nil,13,4,7,2,nil,nil,5,1])
        let result = sol.pathSum(root, 22)
        XCTAssert(result == 3)
    }
    
    func testPathSum3() throws {
        let root = TreeNode.buildTree([0,1,1])
        let result = sol.pathSum(root, 1)
        XCTAssert(result == 4)
    }
    
    func testLongestZigZag1() throws {
        let root = TreeNode.buildTree([1,nil,1,1,1,nil,nil,1,1,nil,1,nil,nil,nil,1])
        let result = sol.longestZigZag(root)
        XCTAssert(result == 3)
    }
    
    func testLongestZigZag2() throws {
        let root = TreeNode.buildTree([1,1,1,nil,1,nil,nil,1,1,nil,1])
        let result = sol.longestZigZag(root)
        XCTAssert(result == 4)
    }
    
    func testLongestZigZag3() throws {
        let root = TreeNode.buildTree([1])
        let result = sol.longestZigZag(root)
        XCTAssert(result == 0)
    }
    
    func testLowestCommonAncestor1() throws {
        let root = TreeNode.buildTree([3,5,1,6,2,0,8,nil,nil,7,4])
        let p = root?.left
        let q = root?.right
        let r = root
        let result = sol.lowestCommonAncestor(root, p, q)
        XCTAssert(result?.val == r?.val)
    }
    
    func testLowestCommonAncestor2() throws {
        let root = TreeNode.buildTree([3,5,1,6,2,0,8,nil,nil,7,4])
        let p = root?.left
        let q = root?.left?.right?.right
        let r = root?.left
        let result = sol.lowestCommonAncestor(root, p, q)
        XCTAssert(result?.val == r?.val)
    }
    
    func testLowestCommonAncestor3() throws {
        let root = TreeNode.buildTree([1,2])
        let p = root
        let q = root?.left
        let r = root
        let result = sol.lowestCommonAncestor(root, p, q)
        XCTAssert(result?.val == r?.val)
    }
    
    func testRightSideView1() throws {
        let root = TreeNode.buildTree([1,2,3,nil,5,nil,4])
        let result = sol.rightSideView(root)
        XCTAssert(result == [1,3,4])
    }
    
    func testRightSideView2() throws {
        let root = TreeNode.buildTree([1,nil,3])
        let result = sol.rightSideView(root)
        XCTAssert(result == [1,3])
    }
    
    func testRightSideView3() throws {
        let root = TreeNode.buildTree([])
        let result = sol.rightSideView(root)
        XCTAssert(result == [])
    }
    
}


