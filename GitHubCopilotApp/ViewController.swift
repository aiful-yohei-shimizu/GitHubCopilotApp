//
//  ViewController.swift
//  GitHubCopilotApp
//
//  Created by 清水陽平 on 2024/08/27.
//

import UIKit

// ボタンタップでカメラアプリを起動し、カメラアプリで撮影後、ネイティブアプリで撮影した画像を表示する
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cameraButtonTapped(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            present(picker, animated: true)
        } else {
            // カメラが利用できない場合の処理（例：アラート表示）
            let alert = UIAlertController(title: "カメラが利用できません", message: "このデバイスではカメラが利用できません。", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }

    // カメラアプリで撮影後に呼ばれるメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        imageView.image = image
        picker.dismiss(animated: true)
    }

    // キャンセルボタンタップ時に呼ばれるメソッド
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

