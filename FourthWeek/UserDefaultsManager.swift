//
//  UserDefaultsManager.swift
//  FourthWeek
//
//  Created by 이빈 on 1/16/25.
//

import UIKit

class UserDefaultsManager {
    
    // Singleton Pattern
    // 다른 외부에서 UserDefaultsManager 공간을 만들지 않고 하나의 공간에서만 쓰겠다!
    static let shared = UserDefaultsManager()
    
    private init() { }
    
    var age: Int {
        get {
            UserDefaults.standard.integer(forKey: "age")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "age")
        }
    }
    
    var nickname: String {
        get {
            UserDefaults.standard.string(forKey: "name") ?? "대장"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "name")
        }
    }
}



