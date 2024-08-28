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

    // buttonタップで、subViewControllerにpresentで遷移
    // storyboardIDを利用する
    @IBAction func buttonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Sub", bundle: nil)
        if let subVC = storyboard.instantiateViewController(withIdentifier: "SubViewController") as? SubViewController {
            present(subVC, animated: true, completion: nil)
        }
    }

}

