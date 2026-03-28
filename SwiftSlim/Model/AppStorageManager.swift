//
//  AppStorageManager.swift
//  SwiftSlim
//
//  Created by 方君宇 on 2026/3/28.
//

import SwiftUI
import Observation

class AppStorageManager: ObservableObject {
    static let shared = AppStorageManager()  // 全局单例
    private init() {
        loadUserDefault()   // 初始化时同步本地存储
        loadFromiCloud()    // 从iCloud读取数据
    }
    // 防止循环写入标志
    private var isLoading = false
    
    // 进入课程详情页的次数
    @Published var openCount = 0 { didSet {updateValue(key: "openCount",newValue: openCount,oldValue: oldValue)} }
    // 评分窗口
    @Published var hasRequestedReview = false { didSet {updateValue(key: "hasRequestedReview",newValue: hasRequestedReview,oldValue: oldValue)} }
    // 首次打开应用时间
    @Published var firstUsed: Date = Date.distantPast { didSet { updateValue(key: "firstUsed", newValue: firstUsed, oldValue: oldValue)}}
    // 最近一次打开应用时间
    @Published var lastOpenedAt:Date = Date.distantPast { didSet { updateValue(key: "lastOpenedAt", newValue: lastOpenedAt, oldValue: oldValue)}}
    // 累计使用天数
    @Published var daysUsed: Int = 0 { didSet { updateValue(key: "daysUsed", newValue: daysUsed, oldValue: oldValue)}}
    
    // 记录第一次打开日期、最近一次打开日期和累计天数
    func updateAppUsageDay() {
        let now = Date()
        
        // 记录第一次打开日期
        if firstUsed == .distantPast {
            firstUsed = now
            daysUsed = 1
            lastOpenedAt = now
            print("第一次打开，并记录日期:\(firstUsed.formatted())")
            return
        } else {
            print("已记录第一次打开日期:\(firstUsed.formatted())")
        }
        
        // 异常保护：如果最近打开时间比当前时间还晚，说明时间异常
        if lastOpenedAt > now {
            print("检测到异常未来时间，重置 lastOpenedAt")
            lastOpenedAt = now
            return
        }
        
        // 如果不是同一天，则累计使用天数
        if !Calendar.current.isDate(now, inSameDayAs: lastOpenedAt) {
            print("今天是第一次打开，递增累计使用天数")
            daysUsed += 1
        } else {
            print("今天打开过了，不递增使用天数")
        }
        
        // 无论是否同一天，都更新最近一次打开时间
        lastOpenedAt = now
        print("更新最近一次打开日期:\(lastOpenedAt.formatted())")
    }
    
    /// 防止内存泄漏
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSUbiquitousKeyValueStore.didChangeExternallyNotification, object: NSUbiquitousKeyValueStore.default)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willResignActiveNotification, object: nil)
    }
}


// MARK: - 从本地UserDefaults读取数据
extension AppStorageManager {
    // 从本地UserDefaults加载数据
    func loadUserDefault() {
        isLoading = true    // 设置加载进度标志
        defer {
            isLoading = false
            print("退出UserDefaults同步")
        } // 还原加载进度标志
        let defaults = UserDefaults.standard
        // 注册默认值
        //        defaults.register(defaults: [
        //            "isModelConfigManager": true,   // 默认开启 iCloud 同步
        //        ])
        openCount = defaults.integer(forKey: "openCount")   // 进入课程详情页的次数
        hasRequestedReview = defaults.bool(forKey: "hasRequestedReview")    // 评分弹窗
        // 首次使用时间
        if defaults.object(forKey: "firstUsed") == nil {
            firstUsed = Date.distantPast
        } else {
            let timestamp = defaults.double(forKey: "firstUsed")
            firstUsed = Date(timeIntervalSince1970: timestamp)
        }
        // 最近一次打开应用时间
        if defaults.object(forKey: "lastOpenedAt") == nil {
            lastOpenedAt = Date.distantPast
        } else {
            let timestamp = defaults.double(forKey: "lastOpenedAt")
            lastOpenedAt = Date(timeIntervalSince1970: timestamp)
        }
        daysUsed = UserDefaults.standard.integer(forKey: "daysUsed") // 累计使用天数
    }
}

// MARK: - 从iCloud读取数据
extension AppStorageManager {
    
    /// 从 iCloud 读取数据
    /// // 不从iCloud中加载欢迎视图: isCompletedWelcome - Bool，每次下载应用都会显示欢迎视图
    ///
    func loadFromiCloud() {
        isLoading = true    // 设置加载进度标志
        defer {
            isLoading = false
            print("退出 iCloud 云同步")
        } // 还原加载进度标志
        let store = NSUbiquitousKeyValueStore.default
        
        loadValueFromiCloud(key: "openCount")   // 进入课程详情页的次数
        loadValueFromiCloud(key: "hasRequestedReview")    // 评分弹窗
        loadValueFromiCloud(key: "firstUsed")    // 首次打开应用时间
        loadValueFromiCloud(key: "lastOpenedAt")    // 最近一次打开应用时间
        loadValueFromiCloud(key: "daysUsed")    // 累计使用天数
        store.synchronize() // 强制触发数据同步
    }
}


// MARK: - 从 iCloud 同步到 UserDefaults
extension AppStorageManager {
    private func loadValueFromiCloud(key: String) {
        let store = NSUbiquitousKeyValueStore.default
        guard store.object(forKey: key) != nil else {
            print("iCloud中无 \(key)，保持本地值，不同步。")
            return
        }
        print("iCloud中 \(key) 值为\(store.object(forKey: key) ?? "None")")
        switch key {
        case "hasRequestedReview": hasRequestedReview = store.bool(forKey: key)
        case "openCount": openCount = store.object(forKey: key) as? Int ?? 0
            // 首次打开应用时间
        case "firstUsed": firstUsed = Date(timeIntervalSince1970: store.double(forKey: key))
            // 最近一次打开应用时间
        case "lastOpenedAt": lastOpenedAt = Date(timeIntervalSince1970: store.double(forKey: key))
            // 累计使用天数
        case "daysUsed": daysUsed = store.object(forKey: key) as? Int ?? 0
        default:
            print("未定义的 iCloud key：\(key)")
        }
    }
}

// MARK: - 更新字段，保存到 UserDefaults，并尝试同步 iCloud
extension AppStorageManager {
    private func updateValue<T:Equatable>(key: String, newValue: T, oldValue: T) {
        guard newValue != oldValue, !isLoading else { return }
        
        // 同步保存到本地
        let defaults = UserDefaults.standard
        let store = NSUbiquitousKeyValueStore.default
        
        // 处理 Date? 类型
        if let dateValue = newValue as? Date {
            let timestamp = dateValue.timeIntervalSince1970
            defaults.set(timestamp, forKey: key)
            store.set(timestamp, forKey: key)
        }
        // 处理其他类型
        else {
            defaults.set(newValue, forKey: key)
            store.set(newValue, forKey: key)
        }
        
        store.synchronize()
    }
}
