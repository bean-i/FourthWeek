//
//  BlackRadiusLabel.swift
//  FourthWeek
//
//  Created by 이빈 on 1/15/25.
//

import UIKit

protocol SeSAC {
    init()
}

class Mentor: SeSAC {
    
    required init() { //프로토콜의 init
        print("Mentor Init")
    }
    
}

class Jack: Mentor {
    
    override required init() {
        super.init()
        print("Jack Init")
    }
    
}

class BaseLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class PointButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class BlackRadiusLabel: BaseLabel {
    
//    let a = Mentor()
    
    init(color: UIColor) {
        super.init(frame: .zero)
        font = .boldSystemFont(ofSize: 15)
        textColor = color
        backgroundColor = .black
        layer.cornerRadius = 10
        clipsToBounds = true
        textAlignment = .center
    }
    
    // 코드베이스로 코드를 구성할 때 호출되는 초기화 구문
    // 슈퍼클래스로 구현된 init
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    
    // 스토리보드로 구성할 때 호출되는 초기화 구문
    // 프로토콜에 구현된 init => Required Initializer
    // 실패가능한 이니셜라이저 (Failable Initializer)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
}
