//
//  DetailViewModel.swift
//  Todo+profileApp
//
//  Created by t2023-m0056 on 2023/09/21.
//

import Foundation

class DetailViewModel {
    func updateTodo(todo: UseTodo) {
        DataManager.dataManager.updateData(id: todo.id, title: todo.title, modifyDate: todo.modifyDate)
    }
}
