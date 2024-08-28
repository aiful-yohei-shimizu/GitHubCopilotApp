//
//  ViewController.swift
//  GitHubCopilotApp
//
//  Created by 清水陽平 on 2024/08/27.
//

import UIKit
import Vision

// ボタンタップでカメラアプリを起動し、カメラアプリで撮影後、画像からテキストを抽出して表示するアプリ
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var detectedTextLabel: UILabel!
    
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
        // 撮影した画像を取得
        guard let image = info[.originalImage] as? UIImage else {
            return
        }
        
        // 画像からテキストを抽出
        if let text = detectText(image: image) {
            // テキストをラベルに表示
            detectedTextLabel.text = text
        }
        
        // カメラアプリを閉じる
        picker.dismiss(animated: true)
    }

    // 画像からテキストを抽出するメソッド。
    func detectText(image: UIImage) -> String? {
        // 画像からCIImageを生成
        guard let ciImage = CIImage(image: image) else {
            return nil
        }
        
        // 画像からテキストを抽出するリクエストを作成
        let request = VNRecognizeTextRequest { request, error in
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                return
            }
            
            // 抽出したテキストを連結
            let text = observations.compactMap { observation in
                observation.topCandidates(1).first?.string
            }.joined(separator: "\n")
            
            // テキストをラベルに表示
            DispatchQueue.main.async {
                self.detectedTextLabel.text = text
            }
        }
        
        // テキスト抽出リクエストを実行
        let handler = VNImageRequestHandler(ciImage: ciImage)
        do {
            try handler.perform([request])
        } catch {
            print("Error: \(error)")
        }
        
        return nil
    }

    // キャンセルボタンタップ時に呼ばれるメソッド
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // カメラアプリを閉じる
        picker.dismiss(animated: true)
    }
}

