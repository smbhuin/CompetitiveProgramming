import XCTest
@testable import CompetitiveProgramming

final class SlidingWindowTests: XCTestCase {
    
    let sol = SlidingWindowSolution()
    
    func testSlidingWindowTests1() throws {
        XCTAssert(sol.containsNearbyAlmostDuplicate([1,2,3,1], 3, 0) == true)
    }
    
    func testSlidingWindowTests2() throws {
        XCTAssert(sol.containsNearbyAlmostDuplicate([1,5,9,1,5,9], 2, 3) == false)
    }
    
    func testSlidingWindowTests3() throws {
        XCTAssert(sol.containsNearbyAlmostDuplicate([1,2,3,1], 3, 0) == true)
    }
    
    func testBirthday1() throws {
        XCTAssert(sol.birthday([2,2,1,3,2], 4, 2) == 2)
    }
    
}
