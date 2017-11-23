//
//  main.swift
//  Patterns
//
//  Created by Vladislav Gushin on 22/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation

protocol PClient {
    func test()
}

//Порождающие паттерны------------------------------------------------------------------------------------------------------
//1 Фабричный метод (Factory Method)
let factoryClient = FactoryClient()
factoryClient.test()
//2 Абстрактная фабрика
var abstractFactoryClient = AbstractFactoryClient(factory: ConcreteFactory1())
abstractFactoryClient.test()
abstractFactoryClient = AbstractFactoryClient(factory: ConcreteFactory2())
abstractFactoryClient.test()
//3 Одиночка
let singletonClient = SingletonClient()
singletonClient.test()
//4 Прототип
let prototypeClient = PrototypeClient()
prototypeClient.test()
//5 Строитель
let builderClient = BuilderClient()
builderClient.test()

// Структурные паттерны-------------------------------------------------------------------
//1 Декоратор
let decoratorClient = DecoratorClient()
decoratorClient.test()
//2 Адаптер
let adapterClient = AdapterClient()
adapterClient.test()
//3 Фасад
let facadeClient = FacadeClient()
facadeClient.test()
//4 Компоновщик
let compositeClient = CompositeClient()
compositeClient.test()
//5 Заместитель (Прокси)
let proxyClient = ProxyClient()
proxyClient.test()
//6 Мост
let bridgeClient = BridgeClient()
bridgeClient.test()
//7 Приспособленец ===----------------------> soon


//Паттерны поведения-------------------------------------------------------------------
//1 Стратегия
let strategyClient = StrategyClient()
strategyClient.test()
//2 Наблюдатель
let observableClient = ObservableClient()
observableClient.test()
//3 Команда
let commandClient = CommandClient()
commandClient.test()
//4 Шаблонный метод
let templateMethodClient = TemplateMethodClient()
templateMethodClient.test()
//5 Итератор
let iteratorClient = IteratorClient()
iteratorClient.test()
//6 Состояние
let stateClient = StateClient()
stateClient.test()
//7 Цепочка Обязанностей
let chainOfResponsibilityClient = ChainOfResponsibilityClient()
chainOfResponsibilityClient.test()
//8 Интерпретатор ===----------------------> soon
//9 Посредник
let mediatorClient = MediatorClient()
mediatorClient.test()
//10 Хранитель
let mementoClient = MementoClient()
mementoClient.test()
//11 Посетитель
let visitorClient = VisitorClient()
visitorClient.test()


//// SOLID----------------------------------------------------------------------------
//// S - Single Responsibility Principle
//let singleResponsibilityPrincipleClient = SingleResponsibilityPrincipleClient()
//singleResponsibilityPrincipleClient.test()
//
//// O - Open/Closed Principle
//let openClosedPrinciple = OpenClosedPrinciple()
//openClosedPrinciple.test()
//
/////TASK
//print(TaskWithNumber.sharedTaskNumber.getLine())

