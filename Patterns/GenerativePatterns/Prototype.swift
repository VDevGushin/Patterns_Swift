//
//  Prototype.swift
//  Patterns
//
//  Created by Vladislav Gushin on 22/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation
/*
 Паттерн Прототип (Prototype) позволяет создавать объекты на основе уже ранее созданных объектов-прототипов. То есть по сути данный паттерн предлагает технику клонирования объектов.
 Когда использовать Прототип?
 Когда конкретный тип создаваемого объекта должен определяться динамически во время выполнения
 Когда нежелательно создание отдельной иерархии классов фабрик для создания объектов-продуктов из параллельной иерархии классов (как это делается, например, при использовании паттерна Абстрактная фабрика)
 Когда клонирование объекта является более предпочтительным вариантом нежели его создание и инициализация с помощью конструктора. Особенно когда известно, что объект может принимать небольшое ограниченное число возможных состояний.
 */

///Prototype: определяет интерфейс для клонирования самого себя, который, как правило, представляет метод Clone()
protocol Prototype{
    var id : Int { get set }
    func clone()->Prototype
    init(id : Int)
    func log()
}


//ConcretePrototype1 и ConcretePrototype2: конкретные реализации прототипа. Реализуют метод Clone()
class ConcretePrototype1 : Prototype{
    var id: Int
    required init(id: Int) {
        self.id = id
    }
    func clone()->Prototype{
        return ConcretePrototype1(id: self.id)
    }
    func log(){
        print("ConcretePrototype1")
    }
}

class ConcretePrototype2 : Prototype{
    var id: Int
    required init(id: Int) {
        self.id = id
    }
    func clone()->Prototype{
        return ConcretePrototype2(id: self.id)
    }
    func log(){
        print("ConcretePrototype2")
    }
}

//Client: создает объекты прототипов с помощью метода Clone()
class PrototypeClient : PClient {
    func test() {
        let prototype = ConcretePrototype1(id: 1);
        let clone = prototype.clone();
        let prototype1 = ConcretePrototype2(id: 2)
        let clone1 = prototype1.clone();
        clone.log()
        clone1.log()
    }
}


