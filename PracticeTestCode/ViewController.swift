//
//  ViewController.swift
//  PracticeTestCode
//
//  Created by Johnny Toda on 2022/12/03.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var gameCountLabel: UILabel!

    @IBOutlet private weak var winCountLabel: UILabel!

    @IBOutlet private weak var loseCountLabel: UILabel!

    @IBOutlet private weak var drawCountLabel: UILabel!

    @IBOutlet private weak var myHandImageView: UIImageView!

    @IBOutlet private weak var opponentHandImageView: UIImageView!

    @IBAction private func didTapRockButton(_ sender: Any) {

    }

    @IBAction private func didTapPaperButton(_ sender: Any) {

    }

    @IBAction private func didTapScissorsButton(_ sender: Any) {

    }

    // モデルのインスタンスを格納したプロパティを定義
    private var game = Game()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    // UIの更新を実行
    private func updateUI() {
        gameCountLabel.text = String(game.gameCount)
        winCountLabel.text = String(game.winCount)
        loseCountLabel.text = String(game.loseCount)
        drawCountLabel.text = String(game.drawCount)
    }
}
