//
//  Memento.swift
//  Patterns
//
//  Created by Vladislav Gushchin on 23/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation

//Memento: хранитель, который сохраняет состояние объекта Originator и предоставляет полный доступ только этому объекту Originato
class Memento{
    var state : String
    init(state : String){
        self.state = state
    }
}

//Caretaker: выполняет только функцию хранения объекта Memento, в то же время у него нет полного доступа к хранителю и никаких других операций над хранителем, кроме собственно сохранения, он не производит
protocol Caretaker{
    var memento: Memento {get set}
}

//Originator: создает объект хранителя для сохранения своего состояния
class Originator{
    var state : String = ""{
        didSet{
                print("New state = \(state)")
        }
    }
    func setMemento(memento : Memento){
        self.state = memento.state
    }
    func createMemento()->Memento{
        return Memento(state: state)
    }
}

class MementoClient : PClient{
    func test() {
        let o = Originator()
        o.state = "normal"
        let m = o.createMemento()
        print(m.state)
        o.state = "GoGOGOGO"
        o.setMemento(memento: m)
    }
}
