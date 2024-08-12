
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
    
}
