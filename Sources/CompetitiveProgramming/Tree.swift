
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
    
}
