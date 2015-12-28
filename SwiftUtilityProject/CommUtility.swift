//
//  CommUtility.swift
//  SwiftUtilityProject
//
//  Created by 陆杨 on 15/11/19.
//  Copyright © 2015年 TDENERGYs. All rights reserved.
//

import Foundation
import UIKit
import CoreTelephony

// MARK: String functions
/** 
 check str is empty
 */
func strIsEmpty(str: String) -> Bool {
    let result = str.compare("")
    
    if result == NSComparisonResult.OrderedSame {
        return true
    }
    
    return false
}

// MARK: -版本更新检查
/*!
版本更新检查

- parameter newVer: 新版本

- returns: 是否需要更新版本
*/
func verIsNeedUpdate(newVer: String) -> Bool {
    
    let mainBundle = NSBundle.mainBundle()
        
    let appVer:AnyObject? = mainBundle.objectForInfoDictionaryKey("CFBundleShortVersionString")
    print("curren ver: \(appVer)")
    
    let result = appVer?.caseInsensitiveCompare(newVer)
    if result == NSComparisonResult.OrderedAscending {
        return true
    }
    return false
}


func currentDevice() -> UIDevice {
    return UIDevice.currentDevice()
}
//获取设备所有者的名称
func deviceName() -> String {
    return currentDevice().name
}
//获取设备的类别
func deviceModel() -> String {
    return currentDevice().model
}
//获取本地化版本
func deviceLocalizeModel() -> String {
    return currentDevice().localizedModel
}
//获取当前运行的系统
func deviceSytemName() -> String {
    return currentDevice().systemName
}
//获取当前系统的版本
func deviceSystemVersion() -> String {
    return currentDevice().systemVersion
}
//获取当前屏幕分辨率的信息
func deviceResulotionInfo() -> CGSize {
    
    let rect = UIScreen.mainScreen().bounds
    let scale = UIScreen.mainScreen().scale
    
    return CGSizeMake(rect.width * scale, rect.height * scale)
}
//获取屏幕大小
func deviceScreenBounds() -> CGRect {
    return UIScreen.mainScreen().bounds
}

//获取运行商的名称
//需要导入头文件
/*
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
*/
func deviceCarrierName() -> String {
    let info    = CTTelephonyNetworkInfo.init()
    let carrier = info.subscriberCellularProvider
    
    //    let mCarrier = carrier.ob
    return (carrier?.carrierName)!
    //    return mCarrier!
}

//获取推送token
//APP名称
func appName() -> String {
    let mainBundle = NSBundle.mainBundle()
    
    let str:AnyObject? = mainBundle.objectForInfoDictionaryKey("CFBundleDisplayName")
    
    return (str) as! String
}

//APP应用版本
func appVersion() -> String {
    let mainBundle = NSBundle.mainBundle()
    
    let str:AnyObject? = mainBundle.objectForInfoDictionaryKey("CFBundleShortVersionString")
    
    return (str) as! String
}

//APP应用build版本
func appBuildVersion() -> String {
    let mainBundle = NSBundle.mainBundle()
    
    let str:AnyObject? = mainBundle.objectForInfoDictionaryKey("CFBundleVersion")
    
    return (str) as! String
}

//获取手机语言
//获取国家

// MARK: 常用方法
// -------------------------------常用方法-------------------------------
func checkObjIsNull(object: AnyObject?) -> Bool {
    if object == nil {
        return true
    }
    return false
}

/**
*  保存对应key值
*
*  @param kv      key值
*  @param keyName key的名称
*/
func saveNotification(key: String , value: String) {
    let defatuls = NSUserDefaults.standardUserDefaults()
    defatuls.setObject(value, forKey: key)
    defatuls.synchronize()
}

/**
 *  读取key对应的值
 *
 *  @param keyName key值
 *
 *  @return key对应的值
 */
func loadNotification(key: String) -> AnyObject? {
    let defaults = NSUserDefaults.standardUserDefaults()
    let value = defaults.objectForKey(key)
    return value
}








