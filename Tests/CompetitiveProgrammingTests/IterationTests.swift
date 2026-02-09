import XCTest
@testable import CompetitiveProgramming

final class IterationTests: XCTestCase {
    
    let sol = IterativeSolution()
    
    func testBreakingRecords1() throws {
        XCTAssert(sol.breakingRecords([10, 5, 20, 20, 4, 5, 2, 25, 1]) == [2, 4])
    }
    
}
