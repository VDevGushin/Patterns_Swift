//
//  FactoryMethod.swift
//  Patterns
//
//  Created by Vladislav Gushin on 22/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation

/*
 Фабричный метод (Factory Method) - это паттерн, который определяет интерфейс для создания объектов некоторого класса, но непосредственное решение о том, объект какого класса создавать происходит в подклассах. То есть паттерн предполагает, что базовый класс делегирует создание объектов классам-наследникам.
 Когда надо применять паттерн
 Когда заранее неизвестно, объекты каких типов необходимо создавать
 Когда система должна быть независимой от процесса создания новых объектов и расширяемой: в нее можно легко вводить новые классы, объекты которых система должна создавать.
 Когда создание новых объектов необходимо делегировать из базового класса классам наследникам
 */

//Абстрактный класс Product определяет интерфейс класса, объекты которого надо создавать.
protocol Product {
    func log()
}
//Конкретные классы ConcreteProductA и ConcreteProductB представляют реализацию класса Product. Таких классов может быть множество
class ConcreteProductA: Product { func log() { print("ConcreteProductA")} }
class ConcreteProductB: Product  { func log() { print("ConcreteProductB")} }

//Абстрактный класс Creator определяет абстрактный фабричный метод FactoryMethod(), который возвращает объект Product.
protocol Creator {
    func factoryMethod() -> Product
}

// Конкретные классы ConcreteCreatorA и ConcreteCreatorB - наследники класса Creator, определяющие свою реализацию метода FactoryMethod(). Причем метод FactoryMethod() каждого отдельного класса-создателя возвращает определенный конкретный тип продукта. Для каждого конкретного класса продукта определяется свой конкретный класс создателя.
class ConcreteCreatorA: Creator {
    func factoryMethod() -> Product { return ConcreteProductA(); }
}

class ConcreteCreatorB: Creator {
    func factoryMethod() -> Product { return ConcreteProductB(); }
}

/* Таким образом, класс Creator делегирует создание объекта Product своим наследникам. А классы ConcreteCreatorA и ConcreteCreatorB могут самостоятельно выбирать какой конкретный тип продукта им создавать.*/

class FactoryClient : PClient{
    func test() {
        let a = ConcreteCreatorA()
        let b = ConcreteCreatorB()
        a.factoryMethod().log()
        b.factoryMethod().log()
    }
}


