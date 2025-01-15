//
//  KakaoBookSearchViewController.swift
//  SeSACFourthWeek
//
//  Created by Jack on 1/14/25.
//

import UIKit
import SnapKit
import Alamofire
import Kingfisher

class KakaoBookSearchViewController: UIViewController {
    
//    let searchBar = UISearchBar()
    let searchBar = UITextField()
    let tableView = UITableView()
    
    var list: [BookDetail] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        configureSearchBar()
        configureTableView()
        
    }
    
    func configureView() {
        view.backgroundColor = .white
    }
    
    func configureSearchBar() {
        view.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.horizontalEdges.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(44)
        }
        
        searchBar.delegate = self
        searchBar.borderStyle = .roundedRect
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(searchBar.snp.bottom)
        }
        
        tableView.keyboardDismissMode = .onDrag
        tableView.rowHeight = 120
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(KakaoBookSearchTableViewCell.self, forCellReuseIdentifier: KakaoBookSearchTableViewCell.id)

    }
    
    /*
     1. 검색어
     2. 이미지
     */
    
    func callRequest(query: String) {
        print(#function)
        let url = "https://dapi.kakao.com/v3/search/book?query=\(query)"
        
        let header: HTTPHeaders = [
            "Authorization": APIKey.kakao
        ]
        AF.request(url, method: .get, headers: header).responseDecodable(of: Book.self) { response in
            switch response.result {
            case .success(let value):
                print("Success")
                self.list = value.documents
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension KakaoBookSearchViewController: UISearchTextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        
        callRequest(query: searchBar.text!)
        return true
    }
}

//extension KakaoBookSearchViewController: UISearchBarDelegate {
//
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        print(#function)
//        callRequest()
//    }
//    
//
//    
//}


extension KakaoBookSearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: KakaoBookSearchTableViewCell.id, for: indexPath) as? KakaoBookSearchTableViewCell else { return UITableViewCell() }
        
        let data = list[indexPath.row]
        
        cell.titleLabel.text = data.title
        cell.subTitleLabel.text = data.price.formatted()
        cell.overviewLabel.text = data.contents
        let imgURL = URL(string: data.thumbnail)
        cell.thumbnailImageView.kf.setImage(with: imgURL)
        
        return cell
    }
    
}

