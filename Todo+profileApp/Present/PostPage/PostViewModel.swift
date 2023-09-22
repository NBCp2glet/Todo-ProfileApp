//
//  PostViewModel.swift
//  Todo+profileApp
//
//  Created by t2023-m0056 on 2023/09/21.
//

import Foundation

class PostViewModel {
    func creatTodo(_ todo: UseTodo) {
        DataManager.dataManager.createData(todo)
    }

    func completeTodo(id: UUID) {
        if let new = DataManager.dataManager.readData().first(where: { $0.id == id }) {
            DataManager.dataManager.updateData(id: new.id, isCompleted: !new.isCompleted)
        }
    }

    func getTodo() -> [UseTodo] {
        return DataManager.dataManager.readData()
    }
}
