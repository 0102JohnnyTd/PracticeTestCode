//
//  PracticeTestCodeTests.swift
//  PracticeTestCodeTests
//
//  Created by Johnny Toda on 2022/12/05.
//

import XCTest
@testable import PracticeTestCode


final class PracticeTestCodeTests: XCTestCase {
    // 勝負判定機能をテスト
    func testJudge() {
        XCTAssertEqual(Hand.rock.judge(opponent: .scissors), .win)
        XCTAssertEqual(Hand.rock.judge(opponent: .paper), .lose)
        XCTAssertEqual(Hand.rock.judge(opponent: .rock), .draw)

        XCTAssertEqual(Hand.paper.judge(opponent: .rock), .win)
        XCTAssertEqual(Hand.paper.judge(opponent: .scissors), .lose)
        XCTAssertEqual(Hand.paper.judge(opponent: .paper), .draw)

        XCTAssertEqual(Hand.scissors.judge(opponent: .paper), .win)
        XCTAssertEqual(Hand.scissors.judge(opponent: .rock), .lose)
        XCTAssertEqual(Hand.scissors.judge(opponent: .scissors), .draw)
    }
}
