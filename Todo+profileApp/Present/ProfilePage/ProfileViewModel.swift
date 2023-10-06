//
//  ProfileViewModel.swift
//  Todo+profileApp
//
//  Created by t2023-m0056 on 2023/09/22.
//

import UIKit

class ProfileViewModel {
    let dummyImage = [UIImage(named: "pic0"), UIImage(named: "pic1"), UIImage(named: "pic2"), UIImage(named: "pic3"), UIImage(named: "pic4"), UIImage(named: "pic5"), UIImage(named: "pic6")]

    func getDummyImage() -> [UIImage?] {
        return dummyImage
    }
}
