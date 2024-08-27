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
    // ボタンのタップ時でアラートを表示する
    @IBAction func tapButton(_ sender: Any) {
        let alert = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }

}

