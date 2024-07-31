
/// LeetCode: 933. Number of Recent Calls.
///
/// Solved using queue.
///
/// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of calls.
class RecentCounter {

    var queue: [Int]

    init() {
        queue = []
    }
    
    func ping(_ t: Int) -> Int {
        queue.append(t)
        while let first = queue.first, first < t - 3000 {
            queue.removeFirst()
        }
        return queue.count
    }
}

public extension Solution {
    
    
    /// LeetCode: 649. Dota2 Senate.
    ///
    /// Solved using two queue.
    ///
    /// - Complexity: Time complexity is O(*n*) and space complexity is O(*n*), where *n* is the number of members in senate.
    func predictPartyVictory(_ senate: String) -> String {
        let senate = Array(senate)
        var radiantQueue: [Int] = [] // Holds indices of radiants in sanate
        var direQueue: [Int] = [] // Holds indices of dires in sanate
        for i in 0..<senate.count {
            if senate[i] == "R" {
                radiantQueue.append(i);
            }
            else {
                direQueue.append(i);
            }
        }
        while !radiantQueue.isEmpty && !direQueue.isEmpty {
            let r = radiantQueue.removeFirst()
            let d = direQueue.removeFirst()
            if r < d {
                radiantQueue.append(r + senate.count)
            }
            else {
                direQueue.append(d + senate.count)
            }
        }
        return radiantQueue.isEmpty ? "Dire" : "Radiant"
    }
}
