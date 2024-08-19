
public extension Solution {
    
    /// Utility function to balance heap after removing an element.
    func heapShiftDown(_ nums: inout [Int], _ condition: (Int, Int) -> Bool) {
        let len = nums.count
        guard len > 0 else { return }
        var currentIndex = 0
        while true {
            let leftIndex = 2 * currentIndex + 1
            let rightIndex = 2 * currentIndex + 2
            if rightIndex < len {
                var maxNumIndex = 0
                if condition(nums[leftIndex], nums[rightIndex]) {
                    maxNumIndex = leftIndex
                }
                else {
                    maxNumIndex = rightIndex
                }
                if condition(nums[maxNumIndex], nums[currentIndex]) {
                    nums.swapAt(currentIndex, maxNumIndex)
                    currentIndex = maxNumIndex
                }
                else {
                    break
                }
            }
            else if leftIndex < len {
                if condition(nums[leftIndex], nums[currentIndex]) {
                    nums.swapAt(currentIndex, leftIndex)
                    currentIndex = leftIndex
                }
                else {
                    break
                }
            }
            else {
                break
            }
        }
    }
    
    /// Utility function to balance heap after inserting an element.
    func heapShiftUp(_ nums: inout [Int], _ condition: (Int, Int) -> Bool) {
        var currentIndex = nums.count - 1
        while true {
            let parentIndex = (currentIndex - 1) / 2
            if parentIndex >= 0 {
                if condition(nums[currentIndex], nums[parentIndex]) {
                    nums.swapAt(currentIndex, parentIndex)
                    currentIndex = parentIndex
                }
                else {
                    break
                }
            }
            else {
                break
            }
        }
    }
    
    /// LeetCode: 215. Kth Largest Element in an Array.
    ///
    /// Solved using heap.
    ///
    /// - Complexity: Time complexity is O(*nlogn*), where n is the size of the array `nums`. Space complexity is O(1), only constant space is used.
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var arr: [Int] = []
        var k = k
        var result = 0
        guard nums.count >= k else {
            return -1
        }
        for num in nums {
            arr.append(num)
            heapShiftUp(&arr, >)
        }
        while k > 0 {
            result = arr[0]
            arr.swapAt(0, arr.count-1)
            arr.removeLast()
            heapShiftDown(&arr, >)
            k -= 1
        }
        return result
    }
    
}
