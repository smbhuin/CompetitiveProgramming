
public extension Solution {
    
    /// LeetCode: 841. Keys and Rooms.
    ///
    /// Solved using graph DFS algo.
    ///
    /// - Complexity: Time complexity is O(*n + e*), where *n* is the number of `rooms` and *e* is the total number of keys.
    /// Space complexity is O(*n*), where *n* is the additional space required to store visited `rooms` and recursion stack .
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        func dfs(_ room: Int, _ visited: inout Set<Int>) {
            visited.insert(room)
            let nextRooms = rooms[room]
            for nr in nextRooms {
                if !visited.contains(nr) {
                    dfs(nr, &visited)
                }
            }
        }
        var visited: Set<Int> = []
        dfs(0, &visited)
        return visited.count == rooms.count
    }
    
    /// LeetCode: 547. Number of Provinces.
    ///
    /// Solved using graph DFS algo.
    ///
    /// - Complexity: Time complexity is O(*n^2*) and space complexity is O(*n*) , where *n* is the number of `cities`.
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        func dfs(_ city: Int, _ visited: inout Set<Int>) {
            for (neighbor, connected) in isConnected[city].enumerated() {
                if connected == 1 && !visited.contains(neighbor) {
                    visited.insert(neighbor)
                    dfs(neighbor, &visited)
                }
            }
        }
        var visited: Set<Int> = []
        let cities = isConnected.count
        var privinces = 0
        for city in 0..<cities {
            if !visited.contains(city) {
                visited.insert(city)
                dfs(city,&visited)
                privinces += 1
            }
        }
        return privinces
    }
    
    /// LeetCode: 1466. Reorder Routes to Make All Paths Lead to the City Zero.
    ///
    /// Solved using graph DFS algo.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*) , where *n* is the number of `cities`.
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var changedEdges = 0
        var map: [Int:[Int]] = [:]
        for connection in connections {
            map[connection[0], default: []].append(connection[1])
            map[connection[1], default: []].append(-connection[0])
        }
        func dfs(_ city: Int, _ visited: inout Set<Int>) {
            visited.insert(city)
            if let neighbors = map[city] {
                for neighbor in neighbors {
                    let nextCity = abs(neighbor)
                    if !visited.contains(nextCity) {
                        dfs(nextCity, &visited)
                        if neighbor > 0 { changedEdges += 1 }
                    }
                }
            }
        }
        var visited: Set<Int> = []
        dfs(0, &visited)
        return changedEdges
    }
    
    /// LeetCode: 399. Evaluate Division.
    ///
    /// Solved using graph DFS algo.
    ///
    /// - Complexity: Time complexity is O(*Q*(V+E)*) and space complexity is O(*V*) , where *V* is the number of nodes in `equations` graph, *E* is the number of edges in `equations` graph and *Q* is the number of queries..
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        typealias Node = (var: String, val: Double)
        var graph: [String:[Node]] = [:]
        for (eq, val) in zip(equations, values) {
            graph[eq[0], default: []].append((eq[1], val))
            graph[eq[1], default: []].append((eq[0], 1.0/val))
        }
        func dfs(_ curr: String, _ target: String, _ product: Double, _ visited: inout Set<String>) -> Double {
            visited.insert(curr)
            if curr == target {
                return product
            }
            if let nodes = graph[curr] {
                for node in nodes where !visited.contains(node.var) {
                    let v = dfs(node.var, target, product * node.val, &visited)
                    if v != -1.0 {
                        return v
                    }
                }
            }
            return -1.0
        }
        var result: [Double] = []
        for query in queries {
            if let _ = graph[query[0]] {
                var visited: Set<String> = []
                result.append(dfs(query[0], query[1], 1.0, &visited))
            }
            else {
                result.append(-1.0)
            }
        }
        return result
    }
    
}
