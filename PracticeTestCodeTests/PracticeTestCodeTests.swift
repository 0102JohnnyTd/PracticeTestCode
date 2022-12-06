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

    // ゲームの進行をテスト
    func testGameCount() {
        var game = Game()
        XCTAssertEqual(game, Game(gameCount: 0, winCount: 0, loseCount: 0, drawCount: 0))
        game = game.win()
        XCTAssertEqual(game, Game(gameCount: 1, winCount: 1, loseCount: 0, drawCount: 0))
        game = game.lose()
        XCTAssertEqual(game, Game(gameCount: 2, winCount: 1, loseCount: 1, drawCount: 0))
        game = game.draw()
        XCTAssertEqual(game, Game(gameCount: 3, winCount: 1, loseCount: 1, drawCount: 1))
    }
}
