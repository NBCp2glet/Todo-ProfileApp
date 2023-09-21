//
//  Util.swift
//  ProfileDesignApp
//
//  Created by t2023-m0056 on 2023/09/15.
//

import UIKit

class Constant{
    static var defalutMargin = 10
}


struct CurrentTime {
    static func getCurrentTime() -> Date {
        let currentTime = Date()
        return currentTime
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
