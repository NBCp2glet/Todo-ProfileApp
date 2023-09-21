//
//  ToDo+CoreDataProperties.swift
//  Todo+profileApp
//
//  Created by t2023-m0056 on 2023/09/21.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var category: String?
    @NSManaged public var createDate: Date?
    @NSManaged public var modifyDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var title: String?

}

extension ToDo : Identifiable {

}

extension ToDo {
    // 'UseTodo'로 변환하는 함수 추가
    func asUseTodo() -> UseTodo {
        return UseTodo(category: self.category!,
                       createDate: self.createDate!,
                       modifyDate: self.modifyDate!,
                       id: self.id ?? UUID(), // Optional UUID을 기본값으로 처리
                       isCompleted: self.isCompleted,
                       title: self.title ?? "")
    }
}
