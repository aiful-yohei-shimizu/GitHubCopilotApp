//
//  ViewController.swift
//  GitHubCopilotApp
//
//  Created by 清水陽平 on 2024/08/27.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self

    }

    // 端末のモデル名、OSバージョン、名前、容量を取得してリスト化する
    private func getDeviceInfo() -> [String] {
        var deviceInfo: [String] = []
        deviceInfo.append(UIDevice.current.model)
        deviceInfo.append(UIDevice.current.systemVersion)
        deviceInfo.append(UIDevice.current.name)
        deviceInfo.append(UIDevice.current.systemName)
        deviceInfo.append(UIDevice.current.identifierForVendor!.uuidString)
        return deviceInfo
    }

    // getDeviceInfo()の結果をtableViewで表示する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getDeviceInfo().count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath)

        cell.textLabel?.text = getDeviceInfo()[indexPath.row]
        return cell
    }
}


