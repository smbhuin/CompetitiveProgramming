public extension Solution {
    
    /// LeetCode: 390. Removing Stars From a String.
    ///
    /// Solved using stack.
    ///
    /// - Complexity: Time complexity is O(*n*), where n is the length of the string `s`.  Space complexity is O(*n*), where n is the length of the string `s`.
    func removeStars(_ s: String) -> String {
        var ans: [Character] = [] // acts like stack
        for c in s {
            if c == "*" {
                ans.removeLast()
            }
            else {
                ans.append(c)
            }
        }
        return String(ans)
    }
    
    /// LeetCode: 735. Asteroid Collision.
    ///
    /// Solved using stack.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the size of the array `asteroids`.
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack: [Int] = []
        for curr in asteroids {
            var right = curr
            while let left = stack.last, left > 0, right < 0 { // collide possible
                if left == -right {
                    stack.removeLast()
                    right = 0
                }
                else if left < -right {
                    stack.removeLast()
                }
                else {
                    right = 0
                }
            }
            if right != 0 {
                stack.append(right)
            }
        }
        return stack
    }
    
}

