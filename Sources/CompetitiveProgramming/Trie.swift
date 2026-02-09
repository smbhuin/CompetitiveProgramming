
/// LeetCode: 208. Implement Trie (Prefix Tree)
class Trie {
    
    class Node {
        var value: Character
        var children: [Node?]
        var isEnd: Bool
        init(_ value: Character) {
            self.value = value
            self.children = Array(repeating: nil, count: 26)
            self.isEnd = false
        }
    }
    
    var root: Node
    let asciiA = Character("a").asciiValue!

    init() {
        root = Node(Character("\0"))
    }
    
    /// Inserts new word into Trie.
    ///
    /// - Complexity: Time complexity is O(*n*), where *n* is the length of the word.
    func insert(_ word: String) {
        var node: Node = root
        for c in word {
            let index = Int(c.asciiValue! - asciiA)
            if let n = node.children[index] {
                node = n
            }
            else {
                let cn = Node(c)
                node.children[index] = cn
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
            let index = Int(c.asciiValue! - asciiA)
            if let n = node.children[index] {
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
            let index = Int(c.asciiValue! - asciiA)
            if let n = node.children[index] {
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
    
    /// LeetCode: 1268. Search Suggestions System
    ///
    /// Solved using trie.
    ///
    /// - Complexity: Time complexity is O(*m*), where *m* is the total number of characters in the products. Space complexity is O(*n*), where *n* is the number of nodes in the trie.
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        let trie = Trie()
        for product in products {
            trie.insert(product)
        }
        func explore(_ node: Trie.Node,_ prod: inout String, _ prods: inout [String]) {
            prod.append(node.value)
            if prods.count >= 3 {
                return
            }
            if node.isEnd {
                prods.append(String(prod))
            }
            for child in node.children {
                if let c = child {
                    explore(c, &prod, &prods)
                    prod.removeLast()
                }
            }
        }
        var result: [[String]] = []
        var root: Trie.Node? = trie.root
        var word = ""
        for char in searchWord {
            let index = Int(char.asciiValue! - trie.asciiA)
            var prods: [String] = []
            root = root?.children[index]
            if let node = root {
                explore(node, &word, &prods)
            }
            result.append(prods)
        }
        return result
    }
    
    /// HackerRank: Two Two.
    ///
    /// Solved using trie.
    ///
    /// - Complexity: Time complexity is O(*n^3* ?? ) and space complexity is O(n), where *n* is the number of chars in the string `a`.
    func twoTwo(a: String) -> Int {
        let root = DigitTrieNode(255)
        root.children[1] = DigitTrieNode(1, isEnd: true)
        var tmp: [UInt8] = Array(repeating: 0, count: 242)
        tmp[0] = 1
        var numLen = 1
        for _ in 1...800 {
            var p = 0
            var carry: UInt8 = 0
            while p < numLen {
                tmp[p] = (tmp[p] * 2) + carry
                carry = tmp[p] / 10
                tmp[p] = tmp[p] % 10
                p += 1
            }
            if carry != 0 {
                tmp[p] = carry
                p += 1
            }
            numLen = p
            p -= 1
            // Insert into Trie
            var node = root
            while p >= 0 {
                let index = Int(tmp[p])
                var n = node.children[index]
                if n == nil {
                    n = DigitTrieNode(tmp[p])
                    node.children[index] = n
                }
                node = n!
                p -= 1
            }
            node.isEnd = true
        }
        
        let indices = a.indices
        var counter = 0
        for i in indices {
            var node: DigitTrieNode = root
            for c in a[i...] {
                let index = c.wholeNumberValue!
                if let cn = node.children[index] {
                    node = cn
                    if cn.isEnd {
                        counter += 1
                    }
                }
                else {
                    break
                }
            }
        }
        return counter
    }
    
}

class DigitTrieNode {
    var value: UInt8
    var children: [DigitTrieNode?]
    var isEnd: Bool
    init(_ value: UInt8, isEnd: Bool = false) {
        self.value = value
        self.children = Array(repeating: nil, count: 10)
        self.isEnd = isEnd
    }
}
