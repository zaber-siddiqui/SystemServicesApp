//
//  ViewController.swift
//  DevicesystemDataArraywift
//
//  Created by Zaber on 2/4/22.
//

import UIKit
import SystemServices

class NetworkViewController: UIViewController {
    
    @IBOutlet weak var infoTableView: UITableView!
    
    private var systemDataArray = [(String, String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        refreshData()
    }
    
    private func setupUI(){
        infoTableView.register(SytemInfoTableCell.nib(), forCellReuseIdentifier: SytemInfoTableCell.identifier())
    }
    
    
    private func refreshData(){
        systemDataArray.removeAll()
        infoTableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1){
            self.getAllNetworkSystemDataArray()
            self.infoTableView.reloadData()
        }
    }
    
    private func getAllNetworkSystemDataArray(){
        systemDataArray.append(("CarrierName :",  SystemServicesHelper.shared.carrierName() ?? "Unknown"))
        systemDataArray.append(("Carrier Country :",  SystemServicesHelper.shared.carrierCountry() ?? "Unknown"))
        systemDataArray.append(("Carrier Mobile Country Code :",  SystemServicesHelper.shared.carrierMobileCountryCode() ?? "Unknown"))
        systemDataArray.append(("Carrier ISO Country Code :",  SystemServicesHelper.shared.carrierISOCountryCode() ?? "Unknown"))
        systemDataArray.append(("Carrier Mobile Network Code :",  SystemServicesHelper.shared.carrierMobileNetworkCode() ?? "Unknown"))
        systemDataArray.append(("Carrier Allows VOIP :",  SystemServicesHelper.shared.carrierAllowsVOIP().description))
        
        systemDataArray.append(("Current IP Address :",  SystemServicesHelper.shared.currentIPAddress() ?? "Unknown"))
        systemDataArray.append(("External IP Address :",  SystemServicesHelper.shared.externalIPAddress() ?? "Unknown"))
        systemDataArray.append(("Cell IP Address :",  SystemServicesHelper.shared.cellIPAddress() ?? "Unknown"))
        
        systemDataArray.append(("Cell Broadcast Address :",  SystemServicesHelper.shared.cellBroadcastAddress() ?? "Unknown"))
        systemDataArray.append(("WiFi IP Address :",  SystemServicesHelper.shared.wiFiIPAddress() ?? "Unknown"))
        systemDataArray.append(("WiFi Broadcast Address :",  SystemServicesHelper.shared.wiFiBroadcastAddress() ?? "Unknown"))
        systemDataArray.append(("Connected To WiFi :",  SystemServicesHelper.shared.connectedToWiFi().description))
        systemDataArray.append(("Connected To CellNetwork :",  SystemServicesHelper.shared.connectedToCellNetwork().description))
    }
    
    @IBAction func refreshAction(){
        refreshData()
    }
}



extension NetworkViewController: UITableViewDelegate, UITableViewDataSource {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: SytemInfoTableCell.identifier()) as! SytemInfoTableCell
        cell.reload(info: systemDataArray[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}


