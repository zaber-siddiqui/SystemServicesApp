//
//  ViewController.swift
//
//  Created by Zaber on 2/4/22.
//

import UIKit
import SystemServices

class MemoryViewController: UIViewController {
    
    @IBOutlet private weak var totalMemoryLabel: UILabel!
    @IBOutlet private weak var usedMemoryLabel: UILabel!
    @IBOutlet private weak var wiredMemoryLabel: UILabel!
    @IBOutlet private weak var activeMemoryLabel: UILabel!
    @IBOutlet private weak var inactiveMemoryLabel: UILabel!
    @IBOutlet private weak var freeMemoryLabel: UILabel!
    @IBOutlet private weak var purgeableMemoryLabel: UILabel!
    @IBOutlet private weak var chartHolderView: UIView!
    @IBOutlet private weak var chartView: PieChartView!
    
    let chartTitles = ["Used Memory", "Wired Memory", "Active Memory", "Inactive Memory", "Free Memory", "Purgeable Memory"]
    let chartColors : [UIColor] = [.link, .red, .systemGreen, .brown, .purple, .magenta]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usedMemoryLabel.textColor = .link
        wiredMemoryLabel.textColor = .red
        activeMemoryLabel.textColor = .systemGreen
        inactiveMemoryLabel.textColor = .brown
        freeMemoryLabel.textColor = .purple
        purgeableMemoryLabel.textColor = .magenta
        
        refreshData()
    }
    
    @IBAction func refreshAction(){
        refreshData()
    }
    
    private func refreshData(){
        
        totalMemoryLabel.text = String(format: "Memory (RAM): (±) %.2f MB", SystemServicesHelper.shared.totalMemory() ?? 0)
        usedMemoryLabel.text = String(format: "Used Memory: %.2f MB %.0f%%", SystemServicesHelper.shared.usedMemoryinRaw() ?? 0, SystemServicesHelper.shared.usedMemoryinPercent() ?? 0)
        wiredMemoryLabel.text = String(format: "Wired Memory: %.2f MB %.0f%%", SystemServicesHelper.shared.wiredMemoryinRaw() ?? 0, SystemServicesHelper.shared.wiredMemoryinPercent() ?? 0)
        activeMemoryLabel.text = String(format: "Active Memory: %.2f MB %.0f%%", SystemServicesHelper.shared.activeMemoryinRaw() ?? 0, SystemServicesHelper.shared.activeMemoryinPercent() ?? 0)
        inactiveMemoryLabel.text = String(format: "Inactive Memory: %.2f MB %.0f%%", SystemServicesHelper.shared.inactiveMemoryinRaw() ?? 0, SystemServicesHelper.shared.inactiveMemoryinPercent() ?? 0)
        freeMemoryLabel.text = String(format: "Free Memory: %.2f MB %.0f%%", SystemServicesHelper.shared.freeMemoryinRaw() ?? 0, SystemServicesHelper.shared.freeMemoryinPercent() ?? 0)
        purgeableMemoryLabel.text = String(format: "Purgeable Memory: %.2f MB %.0f%%", SystemServicesHelper.shared.purgableMemoryinRaw() ?? 0, SystemServicesHelper.shared.purgableMemoryinPercent() ?? 0)
       
        
        let chartValues : [Double] = [SystemServicesHelper.shared.usedMemoryinPercent() ?? 0,
                                      SystemServicesHelper.shared.wiredMemoryinPercent() ?? 0,
                                      SystemServicesHelper.shared.activeMemoryinPercent() ?? 0,
                                      SystemServicesHelper.shared.inactiveMemoryinPercent() ?? 0,
                                      SystemServicesHelper.shared.freeMemoryinPercent() ?? 0,
                                      SystemServicesHelper.shared.purgableMemoryinPercent() ?? 0]
        
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<chartValues.count {
            dataEntries.append(PieChartDataEntry(value: chartValues[i], label: chartTitles[i]))
        }
        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        
        pieChartDataSet.colors = chartColors
        chartView.data = pieChartData
    }
}

