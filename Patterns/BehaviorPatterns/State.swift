//
//  State.swift
//  Patterns
//
//  Created by Vladislav Gushchin on 23/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation
/*
 Состояние (State) - шаблон проектирования, который позволяет объекту изменять свое поведение в зависимости от внутреннего состояния.
 Когда применяется данный паттерн?
 Когда поведение объекта должно зависеть от его состояния и может изменяться динамически во время выполнения
 Когда в коде методов объекта используются многочисленные условные конструкции, выбор которых зависит от текущего состояния объекта
 */


//State: определяет интерфейс состояния
protocol State{
    func handle(context : ContextState)
}

//Классы StateA и StateB - конкретные реализации состояний
class StateA : State{
    func handle(context : ContextState){
        context.state = StateB()
    }
}
class StateB : State{
    func handle(context : ContextState){
        context.state = StateA()
    }
}

//ContextState: представляет объект, поведение которого должно динамически изменяться в соответствии с состоянием. Выполнение же конкретных действий делегируется объекту состояния
class ContextState{
    var state : State{
        didSet{
            print("Change state")
        }
    }
    init(state : State){
        self.state = state
    }
    func request(){
        self.state.handle(context: self)
    }
}

class StateClient : PClient {
    func test() {
        let c = ContextState(state: StateB())
        c.request()
    }
}

