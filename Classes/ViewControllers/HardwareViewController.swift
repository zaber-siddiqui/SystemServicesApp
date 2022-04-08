//
//  ViewController.swift
//  DevicesystemDataArraywift
//
//  Created by Zaber on 2/4/22.
//

import UIKit
import SystemServices

class HardwareViewController: UIViewController {
    
    @IBOutlet weak var infoTableView: UITableView!
    
    private var systemDataArray = [(String, String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        refreshData()
        
        var infos = SystemServicesHelper.shared.getAllSystemInformation()
        debugPrint("\(infos)")
    }
    
    private func setupUI(){
        infoTableView.register(SytemInfoTableCell.nib(), forCellReuseIdentifier: SytemInfoTableCell.identifier())
    }
    
    @IBAction func refreshAction(){
        refreshData()
    }
    
    func refreshData(){
        systemDataArray.removeAll()
        infoTableView.reloadData()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.1){
            self.getAllHarwaresystemDataArray()
            self.infoTableView.reloadData()
        }
    }
    
    func getAllHarwaresystemDataArray(){
        
        systemDataArray.append(("System Uptime", SystemServicesHelper.shared.systemUptime()))
        systemDataArray.append(("Device Model", SystemServicesHelper.shared.deviceModel()))
        systemDataArray.append(("Device Name", SystemServicesHelper.shared.deviceName()))
        systemDataArray.append(("System Name", SystemServicesHelper.shared.systemName()))
        systemDataArray.append(("Systems Version", SystemServicesHelper.shared.systemsVersion()))
        systemDataArray.append(("System Device Type Not-Formatted", SystemServicesHelper.shared.systemDeviceTypeNotFormatted()))
        systemDataArray.append(("System Device Type Formatted", SystemServicesHelper.shared.systemDeviceTypeFormatted()))
        systemDataArray.append(("Screen Width", SystemServicesHelper.shared.screenWidth().description))
        systemDataArray.append(("Screen Height", SystemServicesHelper.shared.screenHeight().description))
        systemDataArray.append(("Screen Brightness", SystemServicesHelper.shared.screenBrightness().description))
        
        systemDataArray.append(("Multitasking Enabled", SystemServicesHelper.shared.multitaskingEnabled().description))
        systemDataArray.append(("Proximity Sensor Enabled", SystemServicesHelper.shared.proximitySensorEnabled().description))
        systemDataArray.append(("Plugged-In", SystemServicesHelper.shared.pluggedIn().description))
        systemDataArray.append(("Step Counting Available", SystemServicesHelper.shared.stepCountingAvailable().description))
        systemDataArray.append(("Distance Available", SystemServicesHelper.shared.distanceAvailable().description))
        systemDataArray.append(("Floor Counting Available", SystemServicesHelper.shared.floorCountingAvailable().description))
        systemDataArray.append(("jailbroken", SystemServicesHelper.shared.jailbroken().description))
        systemDataArray.append(("Number of Processors", SystemServicesHelper.shared.numberProcessors().description))
        systemDataArray.append(("Number of Active Processors", SystemServicesHelper.shared.numberActiveProcessors().description))
        systemDataArray.append(("Processors Usage", SystemServicesHelper.shared.processorsUsage().description))
        systemDataArray.append(("Headphones Attached", SystemServicesHelper.shared.headphonesAttached().description))
        systemDataArray.append(("Number of Attached Accessories", SystemServicesHelper.shared.numberAttachedAccessories().description))
        systemDataArray.append(("Name of Attached Accessories", SystemServicesHelper.shared.nameAttachedAccessories() ?? "Unknown"))
        systemDataArray.append(("Device Orientation", SystemServicesHelper.shared.deviceOrientation().rawValue.description))
        
        systemDataArray.append(("Carrier Country", SystemServicesHelper.shared.country()))
        systemDataArray.append(("Language", SystemServicesHelper.shared.language() ?? "Unknown"))
        systemDataArray.append(("timeZone", SystemServicesHelper.shared.timeZoneSS()))
        systemDataArray.append(("applicationVersion", SystemServicesHelper.shared.applicationVersion() ?? "Unknown"))
        systemDataArray.append(("clipboardContent", SystemServicesHelper.shared.clipboardContent()?.description ?? ""))
        systemDataArray.append(("CFUUID", SystemServicesHelper.shared.cfuuid().description))
    }
}



extension HardwareViewController: UITableViewDelegate, UITableViewDataSource {
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


