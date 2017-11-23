//
//  AbstractFactory.swift
//  Patterns
//
//  Created by Vladislav Gushin on 22/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation

/*
 Паттерн "Абстрактная фабрика" (Abstract Factory) предоставляет интерфейс для создания семейств взаимосвязанных объектов с определенными интерфейсами без указания конкретных типов данных объектов.
 Когда использовать абстрактную фабрику
 Когда система не должна зависеть от способа создания и компоновки новых объектов
 Когда создаваемые объекты должны использоваться вместе и являются взаимосвязанными*/

//Абстрактный класс фабрики AbstractFactory определяет методы для создания объектов. Причем методы возвращают абстрактные продукты, а не их конкретные реализации.
protocol AbstractFactory {
    func createProductA() -> AbstractProductA
    func createProductB() -> AbstractProductB
}

//Абстрактные классы AbstractProductA и AbstractProductB определяют интерфейс для классов, объекты которых будут создаваться в программе.
protocol AbstractProductA { func log() }
protocol AbstractProductB { func log() }

//Конкретные классы ProductA1 / ProductA2 и ProductB1 / ProductB2 представляют конкретную реализацию абстрактных классов
class ProductA1: AbstractProductA { func log() { print("ProductA1") } }
class ProductB1: AbstractProductB { func log() { print("ProductB1") } }
class ProductA2: AbstractProductA { func log() { print("ProductA2") } }
class ProductB2: AbstractProductB { func log() { print("ProductB2") } }


//Конкретные классы фабрик ConcreteFactory1 и ConcreteFactory2 реализуют абстрактные методы базового класса и непосредственно определяют какие конкретные продукты использовать
class ConcreteFactory1: AbstractFactory {
    func createProductA() -> AbstractProductA {
        return ProductA1()
    }

    func createProductB() -> AbstractProductB {
        return ProductB1()
    }
}

class ConcreteFactory2: AbstractFactory {
    func createProductA() -> AbstractProductA {
        return ProductA2()
    }

    func createProductB() -> AbstractProductB {
        return ProductB2()
    }
}

//Класс клиента Client использует класс фабрики для создания объектов. При этом он использует исключительно абстрактный класс фабрики AbstractFactory и абстрактные классы продуктов AbstractProductA и AbstractProductB и никак не зависит от их конкретных реализаций
class AbstractFactoryClient : PClient {
    var abstractProductA: AbstractProductA
    var abstractProductB: AbstractProductB

    init(factory: AbstractFactory) {
        abstractProductA = factory.createProductA()
        abstractProductB = factory.createProductB()
    }
    func test() {
        abstractProductA.log()
        abstractProductB.log()
    }
}
