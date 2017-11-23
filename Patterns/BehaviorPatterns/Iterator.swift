//
//  Iterator.swift
//  Patterns
//
//  Created by Vladislav Gushchin on 23/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation

/*
 Паттерн Итератор (Iterator) предоставляет абстрактный интерфейс для последовательного доступа ко всем элементам составного объекта без раскрытия его внутренней структуры.*/

//Iterator: определяет интерфейс для обхода составных объектов
protocol Iterator{
    func first()->Int
    func next()->Int
    func isDone()->Bool
    func currentItem()->Int
}

//Aggregate: определяет интерфейс для создания объекта-итератора
protocol Aggregate{
    func createIterator() -> Iterator
    var count : Int {get}
    subscript(index: Int) -> Int {get set}
    init(items : [Int])
}

//ConcreteAggregate: конкретная реализация Aggregate. Хранит элементы, которые надо будет перебирать
class ConcreteAggregate : Aggregate{
    var items = [Int]()
    
    required init(items: [Int]) {
        self.items = items
    }
    
    func createIterator() -> Iterator{
        return ConcreteIterator(self);
    }
    
    var count : Int {
        return items.count
    }
    
    subscript(index: Int) -> Int {
        get{
            return items[index]
        }
        set{
            items[index] = newValue
        }
    }
}

//ConcreteIterator: конкретная реализация итератора для обхода объекта Aggregate. Для фиксации индекса текущего перебираемого элемента использует целочисленную переменную _current
class ConcreteIterator : Iterator{
    private let aggregate : Aggregate
    private var current : Int = 0
    
    init(_ aggregate : Aggregate){
        self.aggregate = aggregate
    }
    
    func first()->Int{
        return aggregate[0]
    }
    
    func next()->Int{
        current += 1
        if (current < aggregate.count){
            return aggregate[current]
        }
        return aggregate[current - 1]
    }
    func isDone()->Bool{
        return current >= aggregate.count
    }
    
    func currentItem()->Int{
        return aggregate[current]
    }
}

//Client: использует объект Aggregate и итератор для его обхода
class IteratorClient : PClient {
    func test() {
        let a = ConcreteAggregate(items: [1,2,3,4,5,6])
        let i = a.createIterator()
        var item = i.first()
        while(!i.isDone()){
            item = i.next()
            print(item)
        }
    }
}
