//
//  BookViewController.swift
//  FourthWeek
//
//  Created by 이빈 on 1/13/25.
//

import UIKit
import SnapKit

class BookViewController: UIViewController {
    
    var mainView = BookView()
    
    
    
    // super X
    override func loadView() {
        view = mainView
    }

    // 코드베이스 -> tableView programmingly
    override func viewDidLoad() {
        super.viewDidLoad()

        UserDefaultsManager.shared.age = 50
        
        
    }
}


