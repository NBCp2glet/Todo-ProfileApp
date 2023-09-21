//
//  NetworkManager.swift
//  Todo+profileApp
//
//  Created by t2023-m0056 on 2023/09/21.
//

import Foundation
import Alamofire

protocol NetworkManagerDelegate: AnyObject {
    func didReceiveData(_ data: [CatImage])
}

class NetworkManager{
    static var networkManger = NetworkManager()
    
    weak var delegate: NetworkManagerDelegate?
    
    func getImage() {
        AF.request("https://api.thecatapi.com/v1/images/search?limit=10", method: .get)
            .responseDecodable(of: [CatImage].self) { response in
                switch response.result {
                case .success(let image):
                    self.delegate?.didReceiveData(image)
                case .failure(let error):
                    print("오류: \(error)")
                }
            }
    }
}
