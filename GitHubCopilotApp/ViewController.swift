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

        print(getDeviceInfo())
    }

    // 端末のモデル名、OSバージョン、名前、容量を取得してリスト化する
    func getDeviceInfo() -> [String] {
        var deviceInfo: [String] = []
        deviceInfo.append(UIDevice.current.model)
        deviceInfo.append(UIDevice.current.systemVersion)
        deviceInfo.append(UIDevice.current.name)
        deviceInfo.append(UIDevice.current.systemName)
        deviceInfo.append(UIDevice.current.identifierForVendor!.uuidString)
        return deviceInfo
    }
}

