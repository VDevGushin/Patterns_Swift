//
//  Singleton.swift
//  Patterns
//
//  Created by Vladislav Gushin on 22/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation
/*
 Одиночка (Singleton, Синглтон) - порождающий паттерн, который гарантирует, что для определенного класса будет создан только один объект, а также предоставит к этому объекту точку доступа.
 Когда надо использовать Синглтон? Когда необходимо, чтобы для класса существовал только один экземпляр
 Синглтон позволяет создать объект только при его необходимости. Если объект не нужен, то он не будет создан. В этом отличие синглтона от глобальных переменных.
 */

class Singleton{
    static let shared  = Singleton()
    private init(){}
    func log(){
        print(Singleton.self)
    }
}

class SingletonClient : PClient {
    func test() {
        Singleton.shared.log()
    }
}
