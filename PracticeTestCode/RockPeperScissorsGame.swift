//
//  RockPeperScissorsGame.swift
//  PracticeTestCode
//
//  Created by Johnny Toda on 2022/12/03.
//

import Foundation

enum Hand {
    case rock
    case paper
    case scissors

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

enum GameResult {
    case win
    case lose
    case draw
}

