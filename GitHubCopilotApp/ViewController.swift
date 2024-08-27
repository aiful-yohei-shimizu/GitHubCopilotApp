//
//  ViewController.swift
//  GitHubCopilotApp
//
//  Created by 清水陽平 on 2024/08/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        showAlert()
    }

    // randomIntをdo-catch文で実行し、catchでアラートを表示する。
    func showAlert() {
        do {
            let random = try randomInt()
            print(random)
        } catch {
            let alert = UIAlertController(title: "Error", message: "randomInt() returned 10 or more", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    // ランダムで1~10の整数値を返却する関数。10以上のときはエラーをthrowする。
    private func randomInt() throws -> Int {
        let random = Int.random(in: 1...10)
        if random >= 10 {
            throw NSError(domain: "randomInt", code: 1, userInfo: nil)
        }
        return random
    }
}

