//
//  BookViewController.swift
//  FourthWeek
//
//  Created by 이빈 on 1/13/25.
//

import UIKit
import SnapKit

class BookViewController: UIViewController {

    lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: createCollectionViewLayout()
    )
    
    // 코드베이스 -> tableView programmingly
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(BookCollectionViewCell.self, forCellWithReuseIdentifier: "BookCollectionViewCell")
        
    }
    
    func createCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .vertical
        return layout
    }
    
}

extension BookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCollectionViewCell", for: indexPath) as! BookCollectionViewCell
        
        cell.bookCoverImageView.layer.cornerRadius = 8
        
        return cell
    }
    
}
