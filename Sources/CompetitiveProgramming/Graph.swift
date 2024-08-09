
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
    
}
