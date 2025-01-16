//
//  NetworkManager.swift
//  FourthWeek
//
//  Created by 이빈 on 1/16/25.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() { }
    
    func randomUser() {
        let url = "https://randomuser.me/api/?results=10"
    
        AF.request(url, method: .get).responseDecodable(of: User.self) { response in
            switch response.result {
            case .success(let value):
                print("success")
//                self.nameLabel.text = value.results[0].name.first
                
            case .failure(let error):
                print("error")
                print(error)
            }
        }
    }
    
}
