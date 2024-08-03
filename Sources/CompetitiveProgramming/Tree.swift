
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
    
}
