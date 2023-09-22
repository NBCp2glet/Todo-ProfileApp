//
//  DataManager.swift
//  ProfileDesignApp
//
//  Created by t2023-m0056 on 2023/09/15.
//

import CoreData
import UIKit

class DataManager {
    static let dataManager = DataManager()
    
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "ToDo")
    
    func readData() -> [UseTodo] {
        let request = NSFetchRequest<NSManagedObject>(entityName: "ToDo")
        do {
            let todoDataArray = try context?.fetch(request) as? [ToDo]
            return todoDataArray!.map { $0.asUseTodo() }
        } catch {
            print("데이터 검색 중 오류 발생: \(error)")
        }
        return []
    }
    
    func createData(_ todo: UseTodo) {
        if let context = context {
            if let entity = NSEntityDescription.entity(forEntityName: "ToDo", in: context) {
                let todoData = NSManagedObject(entity: entity, insertInto: context) as! ToDo
                todoData.title = todo.title
                todoData.category = todo.category
                todoData.isCompleted = false
                todoData.createDate = CurrentTime.getCurrentTime()
                todoData.modifyDate = CurrentTime.getCurrentTime()
                todoData.id = todo.id
                do {
                    try context.save()
                    print("create")
                } catch {
                    print("데이터 저장 중 오류 발생: \(error)")
                }
            }
        }
    }
    
    func updateData(id: UUID, title: String, modifyDate: Date) {
        fetchRequest.predicate = NSPredicate(format: "id == %@", id.uuidString)
        if let context = context {
            do {
                let todoDataArray = try context.fetch(fetchRequest) as? [ToDo]
                if let todoData = todoDataArray?.first {
                    todoData.title = title
                    todoData.modifyDate = modifyDate
                    try context.save()
                    print("update title")
                }
            } catch {
                print("데이터 업데이트 중 오류 발생: \(error)")
            }
        }
    }
    
    func updateData(id: UUID, isCompleted: Bool) {
        fetchRequest.predicate = NSPredicate(format: "id == %@", id.uuidString)
        if let context = context {
            do {
                let todoDataArray = try context.fetch(fetchRequest) as? [ToDo]
                if let todoData = todoDataArray?.first {
                    todoData.isCompleted = isCompleted
                    try context.save()
                    print("update isCompleted")
                }
            } catch {
                print("데이터 업데이트 중 오류 발생: \(error)")
            }
        }
    }
    
    func deleteData(todo: UseTodo) {
        fetchRequest.predicate = NSPredicate(format: "id == %@", todo.id.uuidString)
        if let context = context {
            do {
                let todoDataArray = try context.fetch(fetchRequest)
                if let todoData = todoDataArray.first {
                    context.delete(todoData)
                    try context.save()
                    print("delete")
                }
            } catch {
                print("데이터 삭제 중 오류 발생: \(error)")
            }
        }
    }
}
