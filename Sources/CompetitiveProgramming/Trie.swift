
/// LeetCode: 208. Implement Trie (Prefix Tree)
class Trie {
    
    class Node {
        var value: Character
        var children: Dictionary<Character,Node>
        var isEnd: Bool
        init(_ value: Character) {
            self.value = value
            self.children = [:]
            self.isEnd = false
        }
    }
    
    var root: Node

    init() {
        root = Node(Character("\0"))
    }
    
    /// Inserts new word into Trie.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the length of the word.
    func insert(_ word: String) {
        var node: Node = root
        for c in word {
            if let n = node.children[c] {
                node = n
            }
            else {
                let cn = Node(c)
                node.children[c] = cn
                node = cn
            }
        }
        node.isEnd = true
    }
    
    /// Searches for existing word in Trie.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the length of the word.
    func search(_ word: String) -> Bool {
        var node: Node = root
        for c in word {
            if let n = node.children[c] {
                node = n
            }
            else {
                return false
            }
        }
        return node.isEnd
    }
    
    /// Searches for prefix in Trie.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the length of the prefix.
    func startsWith(_ prefix: String) -> Bool {
        var node: Node = root
        for c in prefix {
            if let n = node.children[c] {
                node = n
            }
            else {
                return false
            }
        }
        return true
    }
}

public extension Solution {
    
}
