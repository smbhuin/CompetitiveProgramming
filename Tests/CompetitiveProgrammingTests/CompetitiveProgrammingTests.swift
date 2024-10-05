import XCTest
@testable import CompetitiveProgramming

final class CompetitiveProgrammingTests: XCTestCase {
    
    let sol = Solution()
    let bruteForceSol = BruteForceSolution()
    let hashingSol = HashingSolution()
    let linkedListSol = LinkedListSolution()
    let matrixSol = MatrixSolution()
    let slidingWinSol = SlidingWindowSolution()
    
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
        XCTAssert(slidingWinSol.findMaxAverage([1,12,-5,-6,50,3], 4) == 12.75)
    }
    
    func testFindMaxAverage2() throws {
        XCTAssert(slidingWinSol.findMaxAverage([5], 1) == 5.0)
    }
    
    func testMaxVowels1() throws {
        XCTAssert(slidingWinSol.maxVowels("abciiidef", 3) == 3)
    }
    
    func testMaxVowels2() throws {
        XCTAssert(slidingWinSol.maxVowels("aeiou", 2) == 2)
    }
    
    func testMaxVowels3() throws {
        XCTAssert(slidingWinSol.maxVowels("leetcode", 3) == 2)
    }
    
    func testLongestOnes1() throws {
        XCTAssert(slidingWinSol.longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2) == 6)
    }
    
    func testLongestOnes2() throws {
        XCTAssert(slidingWinSol.longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3) == 10)
    }
    
    func testLongestOnesOpt1() throws {
        XCTAssert(slidingWinSol.longestOnesII([1,1,1,0,0,0,1,1,1,1,0], 2) == 6)
    }
    
    func testLongestOnesOpt2() throws {
        XCTAssert(slidingWinSol.longestOnesII([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3) == 10)
    }
    
    func testLongestSubarray1() throws {
        XCTAssert(slidingWinSol.longestSubarray([1,1,0,1]) == 3)
    }
    
    func testLongestSubarray2() throws {
        XCTAssert(slidingWinSol.longestSubarray([0,1,1,1,0,1,1,0,1]) == 5)
    }
    
    func testLongestSubarray3() throws {
        XCTAssert(slidingWinSol.longestSubarray([1,1,1]) == 2)
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
    
    // MARK: - Hashing
    
    func testFindDifference1() throws {
        let result = hashingSol.findDifference([1,2,3],[2,4,6])
        XCTAssert(Set(result[0]) == Set([1,3]))
        XCTAssert(Set(result[1]) == Set([4,6]))
    }
    
    func testFindDifference2() throws {
        let result = hashingSol.findDifference([1,2,3,3],[1,1,2,2])
        XCTAssert(Set(result[0]) == Set([3]))
        XCTAssert(Set(result[1]) == Set([]))
    }
    
    func testUniqueOccurrences1() throws {
        XCTAssert(hashingSol.uniqueOccurrences([1,2,2,1,1,3]) == true)
    }
    
    func testUniqueOccurrences2() throws {
        XCTAssert(hashingSol.uniqueOccurrences([1,2]) == false)
    }
    
    func testUniqueOccurrences3() throws {
        XCTAssert(hashingSol.uniqueOccurrences([-3,0,1,-3,1,1,1,-3,10,0]) == true)
    }
    
    func testCloseStrings1() throws {
        XCTAssert(hashingSol.closeStrings("abc", "bca") == true)
    }
    
    func testCloseStrings2() throws {
        XCTAssert(hashingSol.closeStrings("a", "aa") == false)
    }
    
    func testCloseStrings3() throws {
        XCTAssert(hashingSol.closeStrings("cabbba", "abbccc") == true)
    }
    
    func testCloseStrings4() throws {
        XCTAssert(hashingSol.closeStrings("uau", "ssx") == false)
    }
    
    func testCloseStrings5() throws {
        XCTAssert(hashingSol.closeStrings("aaabbbbccddeeeeefffff", "aaaaabbcccdddeeeeffff") == false)
    }
    
    func testEqualPairs1() throws {
        XCTAssert(hashingSol.equalPairs([[3,2,1],[1,7,6],[2,7,7]]) == 1)
    }
    
    func testEqualPairs2() throws {
        XCTAssert(hashingSol.equalPairs([[3,1,2,2],[1,4,4,5],[2,4,2,2],[2,4,2,2]]) == 3)
    }
    
    func testEqualPairs3() throws {
        XCTAssert(hashingSol.equalPairs([[3,1,2,2],[1,4,4,4],[2,4,2,2],[2,5,2,2]]) == 3)
    }
    
    func testEqualPairs4() throws {
        XCTAssert(hashingSol.equalPairs([[11,1],[1,11]]) == 2)
    }

    func testSubarraySum1() throws {
        XCTAssert(hashingSol.subarraySum([1,1,1], 2) == 2)
    }
    
    func testSubarraySum2() throws {
        XCTAssert(hashingSol.subarraySum([1,2,3], 3) == 2)
    }
    
    func testSubarraySum3() throws {
        XCTAssert(hashingSol.subarraySum([1], 0) == 0)
    }
    
    func testSubarraySum4() throws {
        XCTAssert(hashingSol.subarraySum([-1,-1,1], 0) == 1)
    }
    
    // MARK: - Greedy
    
    func testPartitionLabels1() throws {
        XCTAssert(sol.partitionLabels("ababcbacadefegdehijhklij") == [9,7,8])
    }
    
    func testPartitionLabels2() throws {
        XCTAssert(sol.partitionLabels("eccbbbbdec") == [10])
    }
    
    // MARK: - Stack
    
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
        let result = linkedListSol.deleteMiddle(head)?.allElements()
        XCTAssert(result == [1,3,4,1,2,6])
    }
    
    func testDeleteMiddle2() throws {
        let head = ListNode.buildLinkedList([1,2,3,4])
        let result = linkedListSol.deleteMiddle(head)?.allElements()
        XCTAssert(result == [1,2,4])
    }
    
    func testDeleteMiddle3() throws {
        let head = ListNode.buildLinkedList([2,1])
        let result = linkedListSol.deleteMiddle(head)?.allElements()
        XCTAssert(result == [2])
    }
    
    func testOddEvenList1() throws {
        let head = ListNode.buildLinkedList([1,2,3,4,5])
        let result = linkedListSol.oddEvenList(head)?.allElements()
        XCTAssert(result == [1,3,5,2,4])
    }
    
    func testOddEvenList2() throws {
        let head = ListNode.buildLinkedList([2,1,3,5,6,4,7])
        let result = linkedListSol.oddEvenList(head)?.allElements()
        XCTAssert(result == [2,3,6,7,1,5,4])
    }
    
    func testReverseList1() throws {
        let head = ListNode.buildLinkedList([1,2,3,4,5])
        let result = linkedListSol.reverseList(head)?.allElements()
        XCTAssert(result == [5,4,3,2,1])
    }
    
    func testReverseList2() throws {
        let head = ListNode.buildLinkedList([1,2])
        let result = linkedListSol.reverseList(head)?.allElements()
        XCTAssert(result == [2,1])
    }
    
    func testReverseList3() throws {
        let result = linkedListSol.reverseList(nil)
        XCTAssert(result == nil)
    }
    
    func testPairSum1() throws {
        let head = ListNode.buildLinkedList([5,4,2,1])
        let result = linkedListSol.pairSum(head)
        XCTAssert(result == 6)
    }
    
    func testPairSum2() throws {
        let head = ListNode.buildLinkedList([4,2,2,3])
        let result = linkedListSol.pairSum(head)
        XCTAssert(result == 7)
    }
    
    func testPairSum3() throws {
        let head = ListNode.buildLinkedList([1,100000])
        let result = linkedListSol.pairSum(head)
        XCTAssert(result == 100001)
    }
    
    func testGetIntersectionNode1() throws {
        let nodeC: ListNode = ListNode(8)
        let headA = ListNode(4)
        headA.append(1).append(nodeC).append(contentsOf: [4,5])
        let headB = ListNode(5)
        headB.append(6).append(1).append(nodeC).append(contentsOf: [4,5])
        let result = linkedListSol.getIntersectionNode(headA,headB)
        XCTAssert(result === nodeC)
    }
    
    func testGetIntersectionNode2() throws {
        let nodeC: ListNode = ListNode(2)
        let headA = ListNode(1)
        headA.append(contentsOf: [9,1]).append(nodeC).append(4)
        let headB = ListNode(3)
        headB.append(nodeC).append(4)
        let result = linkedListSol.getIntersectionNode(headA,headB)
        XCTAssert(result === nodeC)
    }
    
    func testIsPalindrome1() throws {
        let head = ListNode.buildLinkedList([1,2,2,1])
        let result = linkedListSol.isPalindrome(head)
        XCTAssert(result == true)
    }
    
    func testIsPalindrome2() throws {
        let head = ListNode.buildLinkedList([1,2])
        let result = linkedListSol.isPalindrome(head)
        XCTAssert(result == false)
    }
    
    func testSwapPairs1() throws {
        let head = ListNode.buildLinkedList([1,2,3,4])
        let result = linkedListSol.swapPairs(head)
        XCTAssert(result != nil)
        XCTAssert(result!.allElements() == [2,1,4,3])
    }
    
    func testDetectCycle1() throws {
        let head = ListNode(3)
        let pos = ListNode(2)
        head.append(pos).append(0).append(-4).next = pos
        let result = linkedListSol.detectCycle(head)
        XCTAssert(result === pos)
    }
    
    func testDetectCycle2() throws {
        let head = ListNode(1)
        head.append(2).next = head
        let result = linkedListSol.detectCycle(head)
        XCTAssert(result === head)
    }
    
    func testDetectCycle3() throws {
        let head = ListNode(1)
        let result = linkedListSol.detectCycle(head)
        XCTAssert(result == nil)
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
    
    func testMaxLevelSum1() throws {
        let root = TreeNode.buildTree([1,7,0,7,-8,nil,nil])
        let result = sol.maxLevelSum(root)
        XCTAssert(result == 2)
    }
    
    func testMaxLevelSum2() throws {
        let root = TreeNode.buildTree([989,nil,10250,98693,-89388,nil,nil,nil,-32127])
        let result = sol.maxLevelSum(root)
        XCTAssert(result == 2)
    }
    
    func testMaxLevelSum3() throws {
        let root = TreeNode.buildTree([-100,-200,-300,-20,-5,-10,nil])
        let result = sol.maxLevelSum(root)
        XCTAssert(result == 3)
    }
    
    func testSearchBST1() throws {
        let root = TreeNode.buildTree([4,2,7,1,3])
        let result = sol.searchBST(root, 2)
        XCTAssert(result?.val == 2)
    }
    
    func testSearchBST2() throws {
        let root = TreeNode.buildTree([4,2,7,1,3])
        let result = sol.searchBST(root, 5)
        XCTAssert(result == nil)
    }
    
    func testDeleteNode1() throws {
        let root = TreeNode.buildTree([5,3,6,2,4,nil,7])
        let expected = TreeNode.buildTree([5,4,6,2,nil,nil,7])
        let result = sol.deleteNode(root, 3)
        XCTAssert(TreeNode.isEqual(result, expected))
    }
    
    func testDeleteNode2() throws {
        let root = TreeNode.buildTree([5,3,6,2,4,nil,7])
        let expected = TreeNode.buildTree([5,3,6,2,4,nil,7])
        let result = sol.deleteNode(root, 0)
        XCTAssert(TreeNode.isEqual(result, expected))
    }
    
    func testDeleteNode3() throws {
        let root = TreeNode.buildTree([])
        let expected = TreeNode.buildTree([])
        let result = sol.deleteNode(root, 0)
        XCTAssert(TreeNode.isEqual(result, expected))
    }
    
    func testDeleteNode4() throws {
        let root = TreeNode.buildTree([50,30,70,nil,40,60,80])
        let expected = TreeNode.buildTree([60,30,70,nil,40,nil,80])
        let result = sol.deleteNode(root, 50)
        XCTAssert(TreeNode.isEqual(result, expected))
    }
    
    func testInorderTraversal1() throws {
        let root = TreeNode.buildTree([1,nil,2,3])
        XCTAssert(sol.inorderTraversal(root) == [1,3,2])
    }
    
    func testInorderTraversal2() throws {
        let root = TreeNode.buildTree([1,2,3,4,5,nil,8,nil,nil,6,7,9])
        XCTAssert(sol.inorderTraversal(root) == [4,2,6,5,7,1,3,9,8])
    }
    
    func testInorderTraversal3() throws {
        let root = TreeNode.buildTree([])
        XCTAssert(sol.inorderTraversal(root) == [])
    }
    
    func testInorderTraversal4() throws {
        let root = TreeNode.buildTree([1,nil,2,3])
        XCTAssert(sol.inorderTraversal_stack(root) == [1,3,2])
    }
    
    func testInorderTraversal5() throws {
        let root = TreeNode.buildTree([1,2,3,4,5,nil,8,nil,nil,6,7,9])
        XCTAssert(sol.inorderTraversal_stack(root) == [4,2,6,5,7,1,3,9,8])
    }
    
    func testInorderTraversal6() throws {
        let root = TreeNode.buildTree([])
        XCTAssert(sol.inorderTraversal_stack(root) == [])
    }
    
    func testDiameterOfBinaryTree1() throws {
        let root = TreeNode.buildTree([1,2,3,4,5])
        XCTAssert(sol.diameterOfBinaryTree(root) == 3)
    }
    
    func testDiameterOfBinaryTree2() throws {
        let root = TreeNode.buildTree([1,2])
        XCTAssert(sol.diameterOfBinaryTree(root) == 1)
    }
    
    func testDiameterOfBinaryTree3() throws {
        let root = TreeNode.buildTree([2,1,4,3,nil,5])
        XCTAssert(sol.diameterOfBinaryTree(root) == 4)
    }
    
    // MARK: - Graph
    
    func testCanVisitAllRooms1() throws {
        XCTAssert(sol.canVisitAllRooms([[1],[2],[3],[]]) == true)
    }
    
    func testCanVisitAllRooms2() throws {
        XCTAssert(sol.canVisitAllRooms([[1,3],[3,0,1],[2],[0]]) == false)
    }
    
    func testFindCircleNum1() throws {
        XCTAssert(sol.findCircleNum([[1,1,0],[1,1,0],[0,0,1]]) == 2)
    }
    
    func testFindCircleNum2() throws {
        XCTAssert(sol.findCircleNum([[1,0,0],[0,1,0],[0,0,1]]) == 3)
    }
    
    func testFindCircleNum3() throws {
        XCTAssert(sol.findCircleNum([[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]]) == 1)
    }
    
    func testMinReorder1() throws {
        XCTAssert(sol.minReorder(6, [[0,1],[1,3],[2,3],[4,0],[4,5]]) == 3)
    }
    
    func testMinReorder2() throws {
        XCTAssert(sol.minReorder(5, [[1,0],[1,2],[3,2],[3,4]]) == 2)
    }
    
    func testMinReorder3() throws {
        XCTAssert(sol.minReorder(3, [[1,0],[2,0]]) == 0)
    }
    
    func testCalcEquation1() throws {
        XCTAssert(sol.calcEquation([["a","b"],["b","c"]], [2.0,3.0],[["a","c"], ["b","a"],["a","e"],["a","a"],["x","x"]]) == [6.00000,0.50000,-1.00000,1.00000,-1.00000])
    }
    
    func testCalcEquation2() throws {
        XCTAssert(sol.calcEquation([["a","b"],["b","c"],["bc","cd"]], [1.5,2.5,5.0], [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]) == [3.75000,0.40000,5.00000,0.20000])
    }
    
    func testCalcEquation3() throws {
        XCTAssert(sol.calcEquation([["a","b"]], [0.5], [["a","b"],["b","a"],["a","c"],["x","y"]]) == [0.50000,2.00000,-1.00000,-1.00000])
    }
    
    func testNearestExit1() throws {
        XCTAssert(sol.nearestExit([["+","+",".","+"],[".",".",".","+"],["+","+","+","."]], [1,2]) == 1)
    }
    
    func testNearestExit2() throws {
        XCTAssert(sol.nearestExit([["+","+","+"],[".",".","."],["+","+","+"]], [1,0]) == 2)
    }
    
    func testNearestExit3() throws {
        XCTAssert(sol.nearestExit([[".","+"]], [0,0]) == -1)
    }
    
    func testOrangesRotting1() throws {
        XCTAssert(sol.orangesRotting([[2,1,1],[1,1,0],[0,1,1]]) == 4)
    }
    
    func testOrangesRotting2() throws {
        XCTAssert(sol.orangesRotting([[2,1,1],[0,1,1],[1,0,1]]) == -1)
    }
    
    func testOrangesRotting3() throws {
        XCTAssert(sol.orangesRotting([[0,2]]) == 0)
    }
    
    func testOrangesRotting4() throws {
        XCTAssert(sol.orangesRotting([[0]]) == 0)
    }
    
    func testOrangesRotting5() throws {
        XCTAssert(sol.orangesRotting([[2,1,1],[1,1,1],[0,1,2]]) == 2)
    }
    
    // MARK: - Heap
    
    func testFindKthLargest1() throws {
        XCTAssert(sol.findKthLargest([3,2,1,5,6,4], 2) == 5)
    }
    
    func testFindKthLargest2() throws {
        XCTAssert(sol.findKthLargest([3,2,3,1,2,4,5,5,6], 4) == 4)
    }
    
    func testFindKthLargest3() throws {
        XCTAssert(sol.findKthLargest([-1,2,0], 3) == -1)
    }
    
    func testSmallestInfiniteSet1() throws {
        let sis = SmallestInfiniteSet()
        sis.addBack(2)
        XCTAssert(sis.popSmallest() == 1)
        XCTAssert(sis.popSmallest() == 2)
        XCTAssert(sis.popSmallest() == 3)
        sis.addBack(1)
        XCTAssert(sis.popSmallest() == 1)
        XCTAssert(sis.popSmallest() == 4)
        XCTAssert(sis.popSmallest() == 5)
    }
    
    func testMaxScore1() throws {
        XCTAssert(sol.maxScore([1,3,3,2], [2,1,3,4], 3) == 12)
    }
    
    func testMaxScore2() throws {
        XCTAssert(sol.maxScore([4,2,3,1,1], [7,5,10,9,6], 1) == 30)
    }
    
    func testMaxScore3() throws {
        XCTAssert(sol.maxScore([2,1,14,12], [11,7,13,6], 3) == 168)
    }
    
    func testTotalCost1() throws {
        XCTAssert(sol.totalCost([17,12,10,2,7,2,11,20,8], 3, 4) == 11)
    }
    
    func testTotalCost2() throws {
        XCTAssert(sol.totalCost([1,2,4,1], 3, 3) == 4)
    }
    
    func testTopKFrequent1() throws {
        XCTAssert(sol.topKFrequent([1,1,1,2,2,3], 2) == [1,2])
    }
    
    func testTopKFrequent2() throws {
        XCTAssert(sol.topKFrequent([1], 1) == [1])
    }
    
    // MARK: - Binary Search
    
    func testSuccessfulPairs1() throws {
        XCTAssert(sol.successfulPairs([5,1,3], [1,2,3,4,5], 7) == [4,0,3])
    }
    
    func testSuccessfulPairs2() throws {
        XCTAssert(sol.successfulPairs([3,1,2], [8,5,8], 16) == [2,0,2])
    }
    
    func testSuccessfulPairs3() throws {
        XCTAssert(sol.successfulPairs([15,8,19], [38,36,23], 328) == [3,0,3])
    }
    
    func testFindPeakElement1() throws {
        XCTAssert(sol.findPeakElement([1,2,3,1]) == 2)
    }
    
    func testFindPeakElement2() throws {
        XCTAssert([2, 5].contains(sol.findPeakElement([1,2,1,3,5,6,4])))
    }
    
    func testFindPeakElement3() throws {
        XCTAssert([1, 3, 5].contains(sol.findPeakElement([1,2,1,2,1,2,1])))
    }
    
    func testMinEatingSpeed1() throws {
        XCTAssert(sol.minEatingSpeed([3,6,7,11], 8) == 4)
    }
    
    func testMinEatingSpeed2() throws {
        XCTAssert(sol.minEatingSpeed([30,11,23,4,20], 5) == 30)
    }
    
    func testMinEatingSpeed3() throws {
        XCTAssert(sol.minEatingSpeed([30,11,23,4,20], 6) == 23)
    }
    
    // MARK: - Backtracking
    
    func testLetterCombinations1() throws {
        XCTAssert(sol.letterCombinations("23") == ["ad","ae","af","bd","be","bf","cd","ce","cf"])
    }
    
    func testLetterCombinations2() throws {
        XCTAssert(sol.letterCombinations("") == [])
    }
    
    func testLetterCombinations3() throws {
        XCTAssert(sol.letterCombinations("2") == ["a","b","c"])
    }
    
    func testCombinationSum31() throws {
        XCTAssert(sol.combinationSum3(3, 7) == [[1,2,4]])
    }
    
    func testCombinationSum32() throws {
        XCTAssert(sol.combinationSum3(3, 9) == [[1,2,6],[1,3,5],[2,3,4]])
    }
    
    func testCombinationSum33() throws {
        XCTAssert(sol.combinationSum3(4, 1) == [])
    }
    
    func testSolveNQueens1() throws {
        XCTAssert(sol.solveNQueens(4) == [[".Q..","...Q","Q...","..Q."],["..Q.","Q...","...Q",".Q.."]])
    }
    
    func testSubsets1() throws {
        XCTAssert(Set(sol.subsets([1,2,3])) == [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]])
    }
    
    func testSubsets2() throws {
        XCTAssert(Set(sol.subsets([0])) == [[],[0]])
    }
    
    func testPartition1() throws {
        XCTAssert(Set(sol.partition("aab")) == [["a","a","b"],["aa","b"]])
    }
    
    func testPartition2() throws {
        XCTAssert(Set(sol.partition("a")) == [["a"]])
    }
    
    // MARK: - Dynamic Programming
    
    func testTribonacci1() throws {
        XCTAssert(sol.tribonacciII(4) == 4)
    }
    
    func testTribonacci2() throws {
        XCTAssert(sol.tribonacciII(25) == 1389537)
    }
    
    func testTribonacci3() throws {
        XCTAssert(sol.tribonacci(4) == 4)
    }
    
    func testMinCostClimbingStairs1() throws {
        XCTAssert(sol.minCostClimbingStairs([10,15,20]) == 15)
    }
    
    func testMinCostClimbingStairs2() throws {
        XCTAssert(sol.minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1]) == 6)
    }
    
    func testRob1() throws {
        XCTAssert(sol.rob([1,2,3,1]) == 4)
    }
    
    func testRob2() throws {
        XCTAssert(sol.rob([2,7,9,3,1]) == 12)
    }
    
    func testRob3() throws {
        XCTAssert(sol.rob([2,1,1,2]) == 4)
    }
    
    func testRob4() throws {
        XCTAssert(sol.rob([1,2]) == 2)
    }
    
    func testRob5() throws {
        XCTAssert(sol.rob([1,3,1]) == 3)
    }
    
    func testNumTilings1() throws {
        XCTAssert(sol.numTilings(3) == 5)
    }
    
    func testNumTilings2() throws {
        XCTAssert(sol.numTilings(1) == 1)
    }
    
    func testNumTilings3() throws {
        XCTAssert(sol.numTilings(4) == 11)
    }
    
    func testNumTilings4() throws {
        XCTAssert(sol.numTilings(5) == 24)
    }
    
    func testNumTilings5() throws {
        XCTAssert(sol.numTilings(6) == 53)
    }
    
    func testNumTilings6() throws {
        XCTAssert(sol.numTilings(7) == 117)
    }
    
    func testNumTilings7() throws {
        XCTAssert(sol.numTilings(8) == 258)
    }
    
    func testUniquePaths1() throws {
        XCTAssert(sol.uniquePaths(3, 7) == 28)
    }
    
    func testUniquePaths2() throws {
        XCTAssert(sol.uniquePaths(3, 2) == 3)
    }
    
    func testLongestCommonSubsequence1() throws {
        XCTAssert(sol.longestCommonSubsequence("abcde", "ace") == 3)
    }
    
    func testLongestCommonSubsequence2() throws {
        XCTAssert(sol.longestCommonSubsequence("abc", "abc") == 3)
    }
    
    func testLongestCommonSubsequence3() throws {
        XCTAssert(sol.longestCommonSubsequence("abc", "def") == 0)
    }
    
    func testMaxProfit1() throws {
        XCTAssert(sol.maxProfit([1,3,2,8,4,9], 2) == 8)
    }
    
    func testMaxProfit2() throws {
        XCTAssert(sol.maxProfit([1,3,7,5,10,3], 3) == 6)
    }
    
    func testMinDistance1() throws {
        XCTAssert(sol.minDistance("horse", "ros") == 3)
    }
    
    func testMinDistance2() throws {
        XCTAssert(sol.minDistance("intention", "execution") == 5)
    }
    
    func testGenerate1() throws {
        XCTAssert(sol.generate(5) == [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]])
    }
    
    func testGenerate2() throws {
        XCTAssert(sol.generate(1) == [[1]])
    }
    
    func testLongestValidParentheses1() throws {
        XCTAssert(sol.longestValidParentheses("(()") == 2)
    }
    
    func testLongestValidParentheses2() throws {
        XCTAssert(sol.longestValidParentheses(")()())") == 4)
    }
    
    func testLongestValidParentheses3() throws {
        XCTAssert(sol.longestValidParentheses("") == 0)
    }
    
    func testMaxProduct1() throws {
        XCTAssert(sol.maxProduct([2,3,-2,4]) == 6)
    }
    
    func testMaxProduct2() throws {
        XCTAssert(sol.maxProduct([-2,0,-1]) == 0)
    }
    
    func testNumSquares1() throws {
        XCTAssert(sol.numSquares(12) == 3)
    }
    
    func testNumSquares2() throws {
        XCTAssert(sol.numSquares(13) == 2)
    }
    
    func testCanPartition1() throws {
        XCTAssert(sol.canPartition([1,5,11,5]) == true)
    }
    
    func testCanPartition2() throws {
        XCTAssert(sol.canPartition([1,2,3,5]) == false)
    }
    
    func testCanPartition3() throws {
        XCTAssert(sol.canPartition([1,2,3,4,5,6,7]) == true)
    }
    
    func testCanPartition4() throws {
        XCTAssert(sol.canPartition([14,9,8,4,3,2]) == true)
    }
    
    // MARK: - Bit Manipulation
    
    func testCountBits1() throws {
        XCTAssert(sol.countBits(2) == [0,1,1])
    }
    
    func testCountBits2() throws {
        XCTAssert(sol.countBits(5) == [0,1,1,2,1,2])
    }
    
    func testSingleNumber1() throws {
        XCTAssert(sol.singleNumber([2,2,1]) == 1)
    }
    
    func testSingleNumber2() throws {
        XCTAssert(sol.singleNumber([4,1,2,1,2]) == 4)
    }
    
    func testSingleNumber3() throws {
        XCTAssert(sol.singleNumber([1]) == 1)
    }
    
    func testMinFlips1() throws {
        XCTAssert(sol.minFlips(2, 6, 5) == 3)
    }
    
    func testMinFlips2() throws {
        XCTAssert(sol.minFlips(4, 2, 7) == 1)
    }
    
    func testMinFlips3() throws {
        XCTAssert(sol.minFlips(1, 2, 3) == 0)
    }
    
    // MARK: - Trie
    
    func testTriePrefixTree1() throws {
        let obj = Trie()
        obj.insert("apple")
        XCTAssert(obj.search("apple") == true)
        XCTAssert(obj.search("app") == false)
        XCTAssert(obj.startsWith("app") == true)
        obj.insert("app")
        XCTAssert(obj.search("app") == true)
    }
    
    func testSuggestedProducts1() throws {
        XCTAssert(sol.suggestedProducts(["mobile","mouse","moneypot","monitor","mousepad"], "mouse") == [["mobile","moneypot","monitor"],["mobile","moneypot","monitor"],["mouse","mousepad"],["mouse","mousepad"],["mouse","mousepad"]])
    }
    
    func testSuggestedProducts2() throws {
        XCTAssert(sol.suggestedProducts(["havana"], "havana") == [["havana"],["havana"],["havana"],["havana"],["havana"],["havana"]])
    }
    
    // MARK: - Interval
    
    func testEraseOverlapIntervals1() throws {
        XCTAssert(sol.eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]]) == 1)
    }
    
    func testEraseOverlapIntervals2() throws {
        XCTAssert(sol.eraseOverlapIntervals([[1,2],[1,2],[1,2]]) == 2)
    }
    
    func testEraseOverlapIntervals3() throws {
        XCTAssert(sol.eraseOverlapIntervals([[1,2],[2,3]]) == 0)
    }
    
    func testEraseOverlapIntervals4() throws {
        XCTAssert(sol.eraseOverlapIntervals([[1,100],[11,22],[1,11],[2,12]]) == 2)
    }
    
    func testEraseOverlapIntervals5() throws {
        XCTAssert(sol.eraseOverlapIntervals([[0,2],[1,3],[2,4],[3,5],[4,6]]) == 2)
    }
    
    func testEraseOverlapIntervals6() throws {
        XCTAssert(sol.eraseOverlapIntervals([[-52,31],[-73,-26],[82,97],[-65,-11],[-62,-49],[95,99],[58,95],[-31,49],[66,98],[-63,2],[30,47],[-40,-26]]) == 7)
    }
    
    func testFindMinArrowShots1() throws {
        XCTAssert(sol.findMinArrowShots([[10,16],[2,8],[1,6],[7,12]]) == 2)
    }
    
    func testFindMinArrowShots2() throws {
        XCTAssert(sol.findMinArrowShots([[1,2],[3,4],[5,6],[7,8]]) == 4)
    }
    
    func testFindMinArrowShots3() throws {
        XCTAssert(sol.findMinArrowShots([[1,2],[2,3],[3,4],[4,5]]) == 2)
    }
    
    func testFindMinArrowShots4() throws {
        XCTAssert(sol.findMinArrowShots([[3,9],[7,12],[3,8],[6,8],[9,10],[2,9],[0,9],[3,9],[0,6],[2,8]]) == 2)
    }
    
    // MARK: - Monotonic Stack
    
    func testDailyTemperatures1() throws {
        XCTAssert(sol.dailyTemperatures([73,74,75,71,69,72,76,73]) == [1,1,4,2,1,1,0,0])
    }
    
    func testDailyTemperatures2() throws {
        XCTAssert(sol.dailyTemperatures([30,40,50,60]) == [1,1,1,0])
    }
    
    func testDailyTemperatures3() throws {
        XCTAssert(sol.dailyTemperatures([30,60,90]) == [1,1,0])
    }
    
    func testStockSpanner1() throws {
        let obj = StockSpanner()
        XCTAssert(obj.next(100) == 1)
        XCTAssert(obj.next(80) == 1)
        XCTAssert(obj.next(60) == 1)
        XCTAssert(obj.next(70) == 2)
        XCTAssert(obj.next(60) == 1)
        XCTAssert(obj.next(75) == 4)
        XCTAssert(obj.next(85) == 6)
    }
    
    func testStockSpanner2() throws {
        let obj = StockSpanner()
        XCTAssert(obj.next(31) == 1)
        XCTAssert(obj.next(41) == 2)
        XCTAssert(obj.next(48) == 3)
        XCTAssert(obj.next(59) == 4)
        XCTAssert(obj.next(79) == 5)
    }
    
    func testStockSpanner3() throws {
        let obj = StockSpanner()
        XCTAssert(obj.next(28) == 1)
        XCTAssert(obj.next(14) == 1)
        XCTAssert(obj.next(28) == 3)
        XCTAssert(obj.next(35) == 4)
        XCTAssert(obj.next(46) == 5)
        XCTAssert(obj.next(53) == 6)
        XCTAssert(obj.next(66) == 7)
        XCTAssert(obj.next(80) == 8)
        XCTAssert(obj.next(87) == 9)
        XCTAssert(obj.next(88) == 10)
    }
    
}


