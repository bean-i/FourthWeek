//
//  RandomViewController.swift
//  FourthWeek
//
//  Created by 이빈 on 1/14/25.
//

import UIKit
import SnapKit
import Alamofire

struct User: Decodable {
    let results: [UserDetail]
}

struct UserDetail: Decodable {
    let gender: String
    let email: String
    let name: UserName
}

struct UserName: Decodable {
    let first: String
    let last: String
}

struct Lotto: Decodable {
    let drwNoDate: String
    let firstWinamnt: Int
}

struct Dog: Decodable {
    let message: String
    let status: String
}

protocol ViewConfiguration: AnyObject {
    func configureHierarchy() // addSubView
    func configureLayout() // snapKit
    func configureView() // property
}

class RandomViewController: UIViewController, ViewConfiguration {
    func configureView() {
        nameLabel.backgroundColor = .systemGreen
                randomButton.backgroundColor = .brown
                randomButton.addTarget(self, action: #selector(userButtonTapped), for: .touchUpInside)
    }
    
    
    let dogImageView = UIImageView()
    let nameLabel = UILabel()
    let randomButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        view.addSubview(dogImageView)
        view.addSubview(nameLabel)
        view.addSubview(randomButton)
    }
    
    func configureLayout() {
        dogImageView.snp.makeConstraints { make in
            make.size.equalTo(300)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(dogImageView.snp.bottom).offset(20)
        }
        
        randomButton.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
        }
    }
    
//    func configureView() {
//        /Users/ibeen/Desktop/SeSAC/수업_xcode/FourthWeek/FourthWeek/Kakao/KakaoBookSearchTableViewCell.swift        dogImageView.backgroundColor = .brown
//        nameLabel.backgroundColor = .systemGreen
//        randomButton.backgroundColor = .brown
//        randomButton.addTarget(self, action: #selector(userButtonTapped), for: .touchUpInside)
//    }
    
    @objc func randomButtonTapped() {
        print("=======11111111=======")
        // 버튼 누르면 랜덤으로 강아지 나오게
        // 크롬에서 엔터키 눌렀을 때처럼 요청하는 부분
        
        let url = "https://dog.ceo/api/breeds/image/random"
        
//        AF.request(url, method: .get).responseString { value in
//            print(value)
//        } // 얘 성공하면 응답은 잘 오는 거임
        
        // 근데 여기서 실패한다? 구조체가 이상한 거임
        
        // responseDecodable: 응답이 잘못된 것도 실패고 식판에 안 담겨도 실패
        // responseString: 식판이랑 상관없이 응답이 잘 왔는지 확인!
        AF.request(url, method: .get).responseDecodable(of: Dog.self) { response in
            print("=======2222222=======")
            switch response.result {
            case .success(let value): // 응답, 식판 => 구조체를 활용할 수 있다
                print("success")
                self.nameLabel.text = value.message
                // KF
            case .failure(let error): // 응답은 잘 왔는데 식판이 이상한 경우에도 여기로옴
                print("error")
                print(error)
            }
            
            print("=======33333333=======")
        }
        
        print("=======44444444=======")
    }
    
    @objc func lottoButtonTapped() {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(Int.random(in: 800...1154))"
        
        AF.request(url, method: .get).responseDecodable(of: Lotto.self) { response in
            print("=======2222222=======")
            switch response.result {
            case .success(let value): // 응답, 식판 => 구조체를 활용할 수 있다
                print("success")
                self.nameLabel.text = value.drwNoDate + value.firstWinamnt.formatted()
                // KF
            case .failure(let error): // 응답은 잘 왔는데 식판이 이상한 경우에도 여기로옴
                print("error")
                print(error)
            }
            
            print("=======33333333=======")
        }
    }
    
    @objc func userButtonTapped() {
        NetworkManager.shared.randomUser()
    }

}
