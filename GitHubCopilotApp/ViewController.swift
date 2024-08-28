//
//  ViewController.swift
//  GitHubCopilotApp
//
//  Created by 清水陽平 on 2024/08/27.
//

import UIKit

// ストップウォッチ機能の実装
// 00:00:00（時:分:秒）を計測する
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // ストップウォッチの時間を表示するラベル
    @IBOutlet weak var timeLabel: UILabel!

    // ストップウォッチの時間を計測するための変数
    var timer: Timer?
    var count = 0

    // ストップウォッチのスタートボタン
    @IBAction func startButton(_ sender: Any) {
        // タイマーが動いていない場合
        if timer == nil {
            // タイマーを動かす
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerUpdate), userInfo: nil, repeats: true)
        }
    }

    // ストップウォッチのストップボタン
    @IBAction func stopButton(_ sender: Any) {
        // タイマーが動いている場合
        if timer != nil {
            // タイマーを止める
            timer?.invalidate()
            timer = nil
        }
    }

    // ストップウォッチのリセットボタン
    @IBAction func resetButton(_ sender: Any) {
        // タイマーが動いている場合
        if timer != nil {
            // タイマーを止める
            timer?.invalidate()
            timer = nil
        }
        // カウントをリセット
        count = 0
        // タイマーの表示をリセット
        timeLabel.text = "00:00:00"
    }

    // タイマーの更新
    @objc func timerUpdate() {
        // カウントを1増やす
        count += 1
        // カウントを時:分:秒に変換
        let hour = String(format: "%02d", count / 3600)
        let minute = String(format: "%02d", (count % 3600) / 60)
        let second = String(format: "%02d", count % 60)
        // タイマーの表示を更新
        timeLabel.text = "\(hour):\(minute):\(second)"
    }


}

