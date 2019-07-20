//
//  StackViewCell.swift
//  SettingsBundle
//
//  Created by macbook on 7/18/19.
//  Copyright © 2019 jaminya. All rights reserved.
//

import UIKit

class StackViewCell: UITableViewCell {
    
    @IBOutlet weak var autoLabel: UILabel!
    @IBOutlet weak var autoSwitch: UISwitch!
    @IBOutlet weak var alertRefreshSlider: UISlider!
    @IBOutlet weak var autoView: UIView!
    @IBOutlet weak var sliderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoSwitch.isOn = true
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchChanged(_ sender: Any) {
 
        var switchState: [String: String] = [:]
        
        if autoSwitch.isOn == true {
            switchState = ["state" : "on"]
            autoLabel.text = "Automatic"
            sliderView.isHidden = true
            UIView.animate(withDuration: 0.3) {
                self.sliderView.isHidden = true
            }
            NotificationCenter.default.post(name: .didSetSwitch, object: nil, userInfo: switchState)
        } else if autoSwitch.isOn == false {
            switchState = ["state" : "off"]
            autoLabel.text = "Manual"
            UIView.animate(withDuration: 0.3) {
                self.sliderView.isHidden = false
            }
            sliderView.isHidden = false
            NotificationCenter.default.post(name: .didSetSwitch, object: nil, userInfo: switchState)
        }
    }
}
