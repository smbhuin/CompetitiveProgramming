
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
    
    /// LeetCode: 1926. Nearest Exit from Entrance in Maze.
    ///
    /// Solved using graph BFS algo.
    ///
    /// - Complexity: Time complexity is O(*m*n*) and space complexity is O(*m*n*) , where *m* is the number of rows in `maze`, *n* is the number of columns in `maze`.
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        let row = maze.count
        let col = maze[0].count
        let dirs: [[Int]] = [[0,-1],[-1,0],[0,1],[1,0]]
        var queue: [[Int]] = [[entrance[0],entrance[1],0]] // [row, column, step]
        var maze = maze
        maze[entrance[0]][entrance[1]] = "+"
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            for dir in dirs {
                let r = curr[0] + dir[0]
                let c = curr[1] + dir[1]
                let s = curr[2]
                if r >= 0 && r < row && c >= 0 && c < col && maze[r][c] == "." {
                    if r == 0 || r == row - 1 || c == 0 || c == col - 1 { // if on the edge
                        return s + 1
                    }
                    else {
                        maze[r][c] = "+"
                        queue.append([r,c,s + 1])
                    }
                }
            }
        }
        return -1
    }
    
    /// LeetCode: 994. Rotting Oranges.
    ///
    /// Solved using graph BFS algo.
    ///
    /// - Complexity: Time complexity is O(*m*n*) and space complexity is O(*m*n*) , where *m* is the number of rows in `grid`, *n* is the number of columns in `grid`.
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        let dirs: [[Int]] = [[0,-1],[-1,0],[0,1],[1,0]]
        var queue: [[Int]] = []
        var fresh = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 2 {
                    queue.append([i,j])
                }
                else if grid[i][j] == 1 {
                    fresh += 1
                }
            }
        }
        var minutes = 0
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let curr = queue.removeFirst()
                for dir in dirs {
                    let r = curr[0] + dir[0]
                    let c = curr[1] + dir[1]
                    if r >= 0 && r < m && c >= 0 && c < n && grid[r][c] == 1 {
                        grid[r][c] = 2
                        queue.append([r,c])
                    }
                }
            }
            if !queue.isEmpty {
                fresh -= queue.count
                minutes += 1
            }
        }
        if fresh == 0 { // is all the oranges are rotten?
            return minutes
        }
        return -1
    }
    
}
