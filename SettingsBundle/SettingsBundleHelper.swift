//
//  SettingsBundleHelper.swift
//  SettingsBundle
//
//  Created by macbook on 7/23/19.
//  Copyright © 2019 jaminya. All rights reserved.
//

import Foundation

class SettingsBundleHelper {
    
    class func registerSettingsBundle() {
        
        let userDefaults = UserDefaults.standard
        let pathStr = Bundle.main.bundlePath
        let settingsBundlePath = (pathStr as NSString).appendingPathComponent("Settings.bundle")
        let finalPath = (settingsBundlePath as NSString).appendingPathComponent("Root.plist")
        let settingsDict = NSDictionary(contentsOfFile: finalPath)
        guard let prefSpecifierArray = settingsDict?.object(forKey: "PreferenceSpecifiers") as? [[String: Any]] else
        { return }
        
        var defaults = [String: Any]()
        
        for prefItem in prefSpecifierArray {
            guard let key = prefItem["Key"] as? String else { continue }
            defaults[key] = prefItem["DefaultValue"]
        }
        userDefaults.register(defaults: defaults)
    }
    
    class func displayUserDefaults() {
        let userDefaults = UserDefaults.standard
        let version = userDefaults.string(forKey: "version_number")
        if let versionNumber = version {
            print("Version number: \(versionNumber)")
        } else {
            print("No version number")
        }
        
        let build = userDefaults.string(forKey: "build_number")
        if let buildNumber = build {
            print("Build number: \(buildNumber)")
        } else {
            print("No build number")
        }
        
        let schedule = userDefaults.integer(forKey: "schedule_preference")
            print("Alert Schedue: \(schedule)")
    }
    
}
