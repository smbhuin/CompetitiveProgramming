
/// Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public extension TreeNode {
    
    /// Create a binary tree with the elements from the array and returns root.
    class func buildTree(_ elements: [Int?]) -> TreeNode? {
        let n = elements.count
        guard n > 0, let f = elements[0] else { return nil }
        let root = TreeNode(f)
        var queue = Array<TreeNode>()
        queue.append(root)
        var i = 1
        while !queue.isEmpty {
            let current = queue.removeFirst()
            if i < n, let v = elements[i] {
                current.left = TreeNode(v)
                queue.append(current.left!)
            }
            i += 1
            if i < n, let v = elements[i] {
                current.right = TreeNode(v)
                queue.append(current.right!)
            }
            i += 1
        }
        return root
    }
    
}

public extension Solution {
    
    /// LeetCode: 104. Maximum Depth of Binary Tree.
    ///
    /// Solved using tree DFS.
    ///
    /// - Complexity: Time complexity is O(*V+E*), where *V* is the number of vertices and *E* is the number of edges in the tree. Space complexity is O(*V*), where *V* is the number of vertices.
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let lmd = maxDepth(root.left)
        let rmd = maxDepth(root.right)
        return 1 + max(lmd, rmd)
    }
    
    /// LeetCode: 872. Leaf-Similar Trees.
    ///
    /// Solved using tree DFS.
    ///
    /// - Complexity: Time & Space complexity is O(*m+n*), where *m* is the number of nodes in the tree `root1` and *n* is the number of nodes in the tree `root2`.
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        var leafVals1: [Int] = []
        var leafVals2: [Int] = []
        func traverse(_ root: TreeNode?, _ leafVals: inout [Int]) {
            guard let r = root else { return }
            if r.left == nil && r.right == nil {
                leafVals.append(r.val)
            }
            traverse(r.left, &leafVals)
            traverse(r.right, &leafVals)
        }
        traverse(root1, &leafVals1)
        traverse(root2, &leafVals2)
        if leafVals1.count != leafVals2.count {
            return false
        }
        return leafVals1 == leafVals2
    }
    
    /// LeetCode: 1448. Count Good Nodes in Binary Tree.
    ///
    /// Solved using tree DFS.
    ///
    /// - Complexity: Time & Space complexity is O(*n*), where *n* is the number of nodes in the tree `root`.
    func goodNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var stack: [(node: TreeNode, maxVal: Int)] = []
        var count = 0
        stack.append((root,root.val))
        while !stack.isEmpty {
            let current = stack.removeLast()
            if current.maxVal <= current.node.val {
                count += 1
            }
            if let right = current.node.right {
                stack.append((right, max(current.maxVal, right.val)))
            }
            if let left = current.node.left {
                stack.append((left, max(current.maxVal, left.val)))
            }
        }
        return count
    }
    
    /// LeetCode: 437. Path Sum III.
    ///
    /// Solved using tree DFS with prefix sum.
    ///
    /// - Complexity: Time complexity is O(*nlogn*) and space complexity is O(*n*), where *n* is the number of nodes in the tree `root`.
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        var count = 0
        func dfs(_ root: TreeNode?, _ prefixSums: inout [Int]) {
            guard let root = root else { return }
            let currSum = prefixSums.last! + root.val
            for sum in prefixSums {
                if currSum - sum == targetSum {
                    count += 1
                }
            }
            prefixSums.append(currSum)
            if let left = root.left {
                dfs(left, &prefixSums)
                prefixSums.removeLast()
            }
            if let right = root.right {
                dfs(right, &prefixSums)
                prefixSums.removeLast()
            }
        }
        var sums: [Int] = [0]
        dfs(root, &sums)
        return count
    }
    
    /// LeetCode: 1372. Longest ZigZag Path in a Binary Tree.
    ///
    /// Solved using tree DFS.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of nodes in the tree `root`.
    func longestZigZag(_ root: TreeNode?) -> Int {
        var maxLength = 0
        func dfs(_ node: TreeNode?, _ left: Bool, _ count: Int) {
            guard let node = node else {
                maxLength = max(maxLength, count - 1)
                return
            }
            if left {
                dfs(node.left, true, 1)
                dfs(node.right, false, count + 1)
            }
            else {
                dfs(node.left, true, count + 1)
                dfs(node.right, false, 1)
            }
        }
        dfs(root, true, 0)
        dfs(root, false, 0)
        return maxLength
    }
    
    /// LeetCode: 236. Lowest Common Ancestor of a Binary Tree.
    ///
    /// Solved using tree DFS.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of nodes in the tree `root`.
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        if root === p || root === q {
            return root
        }
        let leftNode = lowestCommonAncestor(root.left, p, q)
        let rightNode = lowestCommonAncestor(root.right, p, q)
        if leftNode != nil && rightNode != nil {
            return root
        }
        if leftNode != nil {
            return leftNode
        }
        return rightNode
    }
    
    /// LeetCode: 199. Binary Tree Right Side View.
    ///
    /// Solved using tree BFS.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of nodes in the tree `root`.
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var queue: [TreeNode] = [root]
        var result: [Int] = []
        while !queue.isEmpty {
            result.append(queue.last!.val)
            for _ in 0..<queue.count {
                let curr = queue.removeFirst()
                if let left = curr.left {
                    queue.append(left)
                }
                if let right = curr.right {
                    queue.append(right)
                }
            }
        }
        return result
    }
    
}
