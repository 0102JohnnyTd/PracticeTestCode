//
//  RockPeperScissorsGame.swift
//  PracticeTestCode
//
//  Created by Johnny Toda on 2022/12/03.
//

import Foundation

enum Hand {
    // グー, チョキ, パーを定義
    case rock
    case paper
    case scissors

    // 勝ち負け引き分けを判定する
    func judge(opponent: Hand) -> GameResult {
        switch (self, opponent) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return .win
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            return .lose
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            return .draw
        }
    }
}

// 試合結果を管理する
enum GameResult {
    case win
    case lose
    case draw
}

// ゲームの進行を管理する
// テスト実装の為、ModelをEquatableプロトコルに準拠させる
struct Game: Equatable {
    // 総試合数を表すプロパティ
    var gameCount: Int
    // 勝ち回数を表すプロパティ
    var winCount: Int
    // 負け回数を表すプロパティ
    var loseCount: Int
    // 引き分け回数を表すプロパティ
    var drawCount: Int

    init() {
        gameCount = 0
        winCount = 0
        loseCount = 0
        drawCount = 0
    }

    init(gameCount: Int, winCount: Int, loseCount: Int, drawCount: Int) {
        self.gameCount = gameCount
        self.winCount = winCount
        self.loseCount = loseCount
        self.drawCount = drawCount
    }
    
    // じゃんけんに勝つとwinCountを+1
    func win() -> Game {
        Game(gameCount: self.gameCount + 1, winCount: self.winCount + 1, loseCount: self.loseCount, drawCount: self.drawCount)
    }

    // じゃんけんに負けるとloseCountを+1
    func lose() -> Game {
        Game(gameCount: self.gameCount + 1, winCount: self.winCount, loseCount: self.loseCount + 1, drawCount: self.drawCount)
    }

    // じゃんけんに引き分けるとgameCountだけが+1される
    func draw() -> Game {
        Game(gameCount: self.gameCount + 1, winCount: self.winCount, loseCount: self.loseCount, drawCount: self.drawCount + 1)
    }
}
