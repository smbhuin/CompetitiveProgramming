
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
