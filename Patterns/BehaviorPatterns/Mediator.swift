//
//  Mediator.swift
//  Patterns
//
//  Created by Vladislav Gushchin on 23/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation
/*
 Паттерн Посредник (Mediator) представляет такой шаблон проектирования, который обеспечивает взаимодействие множества объектов без необходимости ссылаться друг на друга. Тем самым достигается слабосвязанность взаимодействующих объектов.
 Когда используется паттерн Посредник?
 Когда имеется множество взаимосвязаных объектов, связи между которыми сложны и запутаны.
 Когда необходимо повторно использовать объект, однако повторное использование затруднено в силу сильных связей с другими объектами.*/

//Mediator: представляет интерфейс для взаимодействия с объектами Colleague
protocol Mediator{
    func send(msg : String, colleague : Colleague)
}

//Colleague: представляет интерфейс для взаимодействия с объектом Mediator
protocol Colleague{
    var id : Int {get set}
    var mediator : Mediator { get set }
    init(mediator : Mediator, id: Int)
}

//ConcreteColleague1 и ConcreteColleague2: конкретные классы коллег, которые обмениваются друг с другом через объект Mediator
class ConcreteColleague1 : Colleague{
    var id: Int
    
    var mediator: Mediator
    
    required init(mediator : Mediator, id: Int){
        self.mediator = mediator
        self.id = id
    }
    func send(message : String){
        mediator.send(msg: message, colleague: self)
    }
    func notify(message : String){
        print(message)
    }
}

class ConcreteColleague2 : Colleague{
    var id: Int
    
    var mediator: Mediator
    
    required init(mediator : Mediator, id: Int){
        self.mediator = mediator
        self.id = id
    }
    func send(message : String){
        mediator.send(msg: message, colleague: self)
    }
    func notify(message : String){
        print(message)
    }
}

//ConcreteMediator: конкретный посредник, реализующий интерфейс типа Mediator
class ConcreteMediator : Mediator{
    var  colleague1 : ConcreteColleague1?
    var  colleague2 : ConcreteColleague2?
    
    func send(msg : String, colleague : Colleague){
        guard let colleague1 = colleague1,
            let colleague2 = colleague2
            else {
                return
        }
        
        if colleague1.id == colleague.id{
            colleague2.notify(message: msg)
        }else{
            colleague1.notify(message: msg)
        }
    }
}

class MediatorClient : PClient {
    func test() {
        let c = ConcreteMediator()
        c.colleague1 = ConcreteColleague1(mediator: c, id: 1)
        c.colleague2 = ConcreteColleague2(mediator: c, id: 2)
        c.send(msg: "Hello", colleague: c.colleague1!)
    }
}
