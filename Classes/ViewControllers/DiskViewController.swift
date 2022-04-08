//
//  ViewController.swift
//
//  Created by Zaber on 2/4/22.
//

import UIKit
import SystemServices

class DiskViewController: UIViewController {
    
    @IBOutlet private var totalDiskLabel: UILabel!
    @IBOutlet private var usedDiskLabel: UILabel!
    @IBOutlet private var freeDiskLabel: UILabel!
    @IBOutlet private var gaugeHolderView: UIView!
    
    private var annotatedGauge: MSAnnotatedGauge!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshData()
    }
    
    @IBAction func refreshAction(){
        refreshData()
    }
    
    private func refreshData(){
        
        totalDiskLabel.text = String(format: "Total Disk Space: %@", SystemServicesHelper.shared.diskSpace() ?? "")
        usedDiskLabel.text = String(format: "Used Disk Space: %@ %@", SystemServicesHelper.shared.usedDiskSpaceinRaw() ?? "", SystemServicesHelper.shared.usedDiskSpaceinPercent() ?? "")
        freeDiskLabel.text = String(format: "Free Disk Space: %@ %@", SystemServicesHelper.shared.freeDiskSpaceinRaw() ?? "", SystemServicesHelper.shared.freeDiskSpaceinPercent() ?? "")
        
        if annotatedGauge == nil {
            annotatedGauge = MSAnnotatedGauge.init(frame: gaugeHolderView.bounds)
            annotatedGauge.minValue = 0
            annotatedGauge.maxValue = 100
            annotatedGauge.backgroundColor = .clear
            
            gaugeHolderView.addSubview(annotatedGauge)
            gaugeHolderView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate(
                [annotatedGauge.leadingAnchor.constraint(equalTo: gaugeHolderView.leadingAnchor),
                 annotatedGauge.trailingAnchor.constraint(equalTo: gaugeHolderView.trailingAnchor),
                 annotatedGauge.topAnchor.constraint(equalTo: gaugeHolderView.topAnchor, constant: 40),
                 annotatedGauge.bottomAnchor.constraint(equalTo: gaugeHolderView.bottomAnchor)]
            )
        }
        
        
        annotatedGauge.titleLabel.text = String(format: "Total Space: %@", SystemServicesHelper.shared.diskSpace() ?? "")
        annotatedGauge.startRangeLabel.text = String(format: "%@ Used", SystemServicesHelper.shared.usedDiskSpaceinRaw() ?? "")
        annotatedGauge.endRangeLabel.text = String(format: "%@ Free", SystemServicesHelper.shared.freeDiskSpaceinRaw() ?? "")
        
        
        var value = SystemServicesHelper.shared.usedDiskSpaceinPercent() ?? ""
        value = value.replacingOccurrences(of: " %", with: "")
        
        annotatedGauge.value = Float(value) ?? 0.0
    }
    
}


