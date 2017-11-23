//
//  Bridge.swift
//  Patterns
//
//  Created by Vladislav Gushin on 22/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation
/*
Мост (Bridge) - структурный шаблон проектирования, который позволяет отделить абстракцию от реализации таким образом, чтобы и абстракцию, и реализацию можно было изменять независимо друг от друга.
Даже если мы отделим абстракцию от конкретных реализаций, то у нас все равно все наследуемые классы будут жестко привязаны к интерфейсу, определяемому в базовом абстрактном классе. Для преодоления жестких связей и служит паттерн Мост.
Когда использовать данный паттерн?
Когда надо избежать постоянной привязки абстракции к реализации
Когда наряду с реализацией надо изменять и абстракцию независимо друг от друга. То есть изменения в абстракции не должно привести к изменениям в реализации
Общая реализация паттерна состоит в объявлении классов абстракций и классов реализаций в отдельных параллельных иерархиях классов.
*/

//Abstraction: определяет базовый интерфейс и хранит ссылку на объект Implementor. Выполнение операций в Abstraction делегируется методам объекта Implementor
protocol Abstraction {
    var implementor: Implementor { get set }
    init(imp: Implementor)
    func operation()
}

//Implementor: определяет базовый интерфейс для конкретных реализаций. Как правило, Implementor определяет только примитивные операции. Более сложные операции, которые базируются на примитивных, определяются в Abstraction
protocol Implementor {
    func operationImp()
}

//RefinedAbstraction: уточненная абстракция, наследуется от Abstraction и расширяет унаследованный интерфейс
class RefinedAbstraction: Abstraction {
    var implementor: Implementor
    required init(imp: Implementor) {
        self.implementor = imp
    }
    func operation() {
        self.implementor.operationImp()
    }
}

//ConcreteImplementorA и ConcreteImplementorB: конкретные реализации, которые унаследованы от Implementor
class ConcreteImplementorA: Implementor{
    func operationImp(){
        print("ConcreteImplementorA")
    }
}
class ConcreteImplementorB: Implementor{
    func operationImp(){
        print("ConcreteImplementorB")
    }
}

///Client: использует объекты Abstraction
class BridgeClient : PClient {
    func test() {
        var abstraction : Abstraction =  RefinedAbstraction(imp : ConcreteImplementorA())
        abstraction.operation()
        abstraction.implementor = ConcreteImplementorB()
        abstraction.operation()
    }
}
