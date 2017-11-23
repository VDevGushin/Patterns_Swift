//
//  Facade.swift
//  Patterns
//
//  Created by Vladislav Gushin on 22/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation
/*
 Фасад (Facade) представляет шаблон проектирования, который позволяет скрыть сложность системы с помощью предоставления упрощенного интерфейса для взаимодействия с ней.
 Когда использовать фасад?
 Когда имеется сложная система, и необходимо упростить с ней работу. Фасад позволит определить одну точку взаимодействия между клиентом и системой.
 Когда надо уменьшить количество зависимостей между клиентом и сложной системой. Фасадные объекты позволяют отделить, изолировать компоненты системы от клиента и развивать и работать с ними независимо.
 Когда нужно определить подсистемы компонентов в сложной системе. Создание фасадов для компонентов каждой отдельной подсистемы позволит упростить взаимодействие между ними и повысить их независимость друг от друга.
 */

//Классы SubsystemA, SubsystemB, SubsystemC и т.д. являются компонентами сложной подсистемы, с которыми должен взаимодействовать клиент
class SubsystemA {
    func A1() { print("A1") }
}
class SubsystemB {
    func B1() { print("B1") }
}
class SubsystemC {
    func C1() { print("C1") }
}

//Facade - непосредственно фасад, который предоставляет интерфейс клиенту для работы с компонентами
class Facade {
    let subsystemA: SubsystemA
    let subsystemB: SubsystemB
    let subsystemC: SubsystemC

    init(sa: SubsystemA, sb: SubsystemB, sc: SubsystemC) {
        subsystemA = sa
        subsystemB = sb
        subsystemC = sc
    }

    func Operation1() {
        subsystemA.A1()
        subsystemB.B1()
        subsystemC.C1()
    }

    func Operation2() {
        subsystemB.B1()
        subsystemC.C1()
    }
}

//Client взаимодействует с компонентами подсистемы
class FacadeClient: PClient {
    func test() {
        let facade = Facade(sa: SubsystemA(), sb: SubsystemB(), sc: SubsystemC())
        facade.Operation1()
        facade.Operation2()
    }
}
