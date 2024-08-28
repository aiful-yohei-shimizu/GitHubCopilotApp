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

    // ボタンタップでAPI通信を行う。
    // API通信は、"https://jsonplaceholder.typicode.com/posts/1"にGETリクエストする。
    // API通信中はインジケーターを表示する。
    // 通信成功時は、SubStoryboardに画面遷移する
    // 通信失敗時は、アラートを表示する。
    @IBAction func didTapButton(_ sender: Any) {
        // インジケーターを表示する
        let indicator = UIActivityIndicatorView()
        indicator.center = view.center
        indicator.style = .large
        view.addSubview(indicator)
        indicator.startAnimating()

        // API®®®通信
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                indicator.stopAnimating()
            }
            
            if let error = error {
                // 通信失敗時は、アラートを表示する
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "通信エラー", message: error.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                // 通信成功時は、SubStoryboardに画面遷移する
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let subVC = storyboard.instantiateViewController(withIdentifier: "SubViewController") as? SubViewController {
                        self.present(subVC, animated: true, completion: nil)
                    }
                }
            }
        }

        task.resume()
    }



}

