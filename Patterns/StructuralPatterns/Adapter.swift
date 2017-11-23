//
//  Adapter.swift
//  Patterns
//
//  Created by Vladislav Gushin on 22/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation

/*
 Паттерн Адаптер (Adapter) предназначен для преобразования интерфейса одного класса в интерфейс другого. Благодаря реализации данного паттерна мы можем использовать вместе классы с несовместимыми интерфейсами.
 Когда надо использовать Адаптер?
 Когда необходимо использовать имеющийся класс, но его интерфейс не соответствует потребностям
 Когда надо использовать уже существующий класс совместно с другими классами, интерфейсы которых не совместимы
 */

//Target: представляет объекты, которые используются клиентом
protocol Target{
    func request()
}

// Adapter: собственно адаптер, который позволяет работать с объектами Adaptee как с объектами Target
class Adapter : Target{
    private let adaptee = Adaptee()
    func request(){
        adaptee.specificRequest();
    }
}

// Adaptee: представляет адаптируемый класс, который мы хотели бы использовать у клиента вместо объектов Target
class Adaptee{
    func specificRequest(){print("specificRequest")}
}

//Client: использует объекты Target для реализации своих задач
class AdapterClient : PClient {
    func test() {
        let target : Target = Adapter()
        target.request()
    }
}
