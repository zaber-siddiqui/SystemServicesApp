//
//  ViewController.swift
//
//  Created by Zaber on 2/4/22.
//

import UIKit
import SystemServices

class ViewController: UIViewController {
    
    @IBOutlet var infoTableView: UITableView!
    
    private var systemDataArray = [(String, String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoTableView.reloadData()
    }
    
    @IBAction func loadAction(_ button: UIButton){
        button.setTitle("Loading....", for: .normal)
        button.isUserInteractionEnabled = false
        
        systemDataArray.removeAll()
        infoTableView.reloadData()
        
        systemDataArray =  SystemServicesHelper.shared.allSystemInformation()
        infoTableView.reloadData()
        
        button.setTitle("Load again", for: .normal)
        button.isUserInteractionEnabled = true
    }
}



extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return systemDataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SystemInfoTableViewCell") as! SystemInfoTableViewCell
        cell.reload(info: systemDataArray[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
}

