//
//  CompleteViewModel.swift
//  Todo+profileApp
//
//  Created by t2023-m0056 on 2023/09/21.
//

import Foundation

class CompleteViewModel {
    func getTodo() -> [UseTodo] {
        return DataManager.dataManager.readData()
    }
}
