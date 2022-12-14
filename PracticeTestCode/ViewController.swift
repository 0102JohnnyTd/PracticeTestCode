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
        startGame(myHand: Hand.rock)
    }

    @IBAction private func didTapPaperButton(_ sender: Any) {
        startGame(myHand: Hand.paper)
    }

    @IBAction private func didTapScissorsButton(_ sender: Any) {
        startGame(myHand: Hand.scissors)
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

    // Storyboard上のUIImageViewに画像を表示
    private func setUpHandImage(myHand: Hand, opponentHand: Hand) {
        myHandImageView.image = myHand.image
        opponentHandImageView.image = opponentHand.image
    }

    // ジャンケンを実行
    private func startGame(myHand: Hand) {
        // コンピューターのジャンケンをランダムで生成して格納
        let opponentHand = Hand.random()

        setUpHandImage(myHand: myHand, opponentHand: opponentHand)

        // 勝負の結果に応じてゲームカウントをプラスしていく
        switch myHand.judge(opponent: opponentHand) {
        case .win:
            game = game.win()
        case .lose:
            game = game.draw()
        case .draw:
            game = game.draw()
        }

        // 値の更新に伴いViewも更新
        updateUI()
    }
}

// グーチョキパーごとに保持する画像を切り替える拡張機能
private extension Hand {
    var image: UIImage {
        switch self {
        case .rock:
            return UIImage(named: "janken_rock")!
        case .paper:
            return UIImage(named: "janken_paper")!
        case .scissors:
            return UIImage(named: "janken_scissors")!
        }
    }
}
