//
//  CatViewModel.swift
//  Todo+profileApp
//
//  Created by t2023-m0056 on 2023/09/22.
//

import Foundation

class CatViewModel {
    func getImage() {
        NetworkManager.networkManger.afGetImage()
    }
}
