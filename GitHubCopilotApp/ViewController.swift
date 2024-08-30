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

    // 端末のモデル名、OSバージョン、名前、ストレージ容量を取得してリスト化する
    func getDeviceInfo() -> [String] {
        var deviceInfo: [String] = []
        deviceInfo.append(UIDevice.current.model)
        deviceInfo.append(UIDevice.current.systemVersion)
        deviceInfo.append(UIDevice.current.name)
        deviceInfo.append(String(getTotalDiskSpace()))
        return deviceInfo
    }

    // ストレージ容量を取得する
    // 戻り値はStringで、「◯GB」
    func getTotalDiskSpace() -> String {
        do {
            let systemAttributes = try FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory() as String)
            if let space = systemAttributes[FileAttributeKey.systemSize] as? NSNumber {
                return String(format: "%.1fGB", space.doubleValue / 1000000000)
            } else {
                return "0GB"
            }
        } catch {
            return "0GB"
        }
    }
}

