//
//  Strategy.swift
//  Patterns
//
//  Created by Vladislav Gushchin on 23/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation

/*
 Паттерн Стратегия (Strategy) представляет шаблон проектирования, который определяет набор алгоритмов, инкапсулирует каждый из них и обеспечивает их взаимозаменяемость. В зависимости от ситуации мы можем легко заменить один используемый алгоритм другим. При этом замена алгоритма происходит независимо от объекта, который использует данный алгоритм.
 Когда использовать стратегию?
 Когда есть несколько родственных классов, которые отличаются поведением. Можно задать один основной класс, а разные варианты поведения вынести в отдельные классы и при необходимости их применять
 Когда необходимо обеспечить выбор из нескольких вариантов алгоритмов, которые можно легко менять в зависимости от условий
 Когда необходимо менять поведение объектов на стадии выполнения программы
 Когда класс, применяющий определенную функциональность, ничего не должен знать о ее реализации
 */

//Интерфейс IStrategy, который определяет метод Algorithm(). Это общий интерфейс для всех реализующих его алгоритмов. Вместо интерфейса здесь также можно было бы использовать абстрактный класс.
protocol Strategy{
    func algorithm()
}


//Классы ConcreteStrategy1 и ConcreteStrategy, которые реализуют интерфейс IStrategy, предоставляя свою версию метода Algorithm(). Подобных классов-реализаций может быть множество.
class ConcreteStrategyOne : Strategy{
    func algorithm() {
        print("ConcreteStrategyOne")
    }
}

class ConcreteStrategyTwo : Strategy{
    func algorithm() {
        print("ConcreteStrategyOne")
    }
}

//Класс Context хранит ссылку на объект IStrategy и связан с интерфейсом IStrategy отношением агрегации.
class Context{
    let contextStrategy : Strategy
    init(strategy : Strategy){
        self.contextStrategy = strategy
    }
    func executeAlgorithm(){
        self.contextStrategy.algorithm()
    }
}

class StrategyClient : PClient {
    func test() {
        let context = Context(strategy:  ConcreteStrategyTwo())
        context.executeAlgorithm()
    }
}
