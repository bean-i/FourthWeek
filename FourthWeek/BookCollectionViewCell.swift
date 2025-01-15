//
//  BookCollectionViewCell.swift
//  FourthWeek
//
//  Created by 이빈 on 1/13/25.
//

import UIKit
import SnapKit

class BookCollectionViewCell: UICollectionViewCell {
    
    let bookCoverImageView = UIImageView()
    
    // awakeFormNib은 XIB가 있을 때만 사용
    // 대신 init 사용. viewDidLoad, awakeFormNib같은 애임
    override init(frame: CGRect) {
        super.init(frame: frame)

        // 셀에는 contentView가 존재! 여기에다가 뷰를 추가해주어야 액션이 동작합니다.
        contentView.addSubview(bookCoverImageView)
        
        bookCoverImageView.snp.makeConstraints { make in
            make.edges.equalTo(safeAreaLayoutGuide)
        }
        
        bookCoverImageView.backgroundColor = .brown
    }
    
    // 내일
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
