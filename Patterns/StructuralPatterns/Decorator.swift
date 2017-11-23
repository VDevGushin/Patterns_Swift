//
//  Decorator.swift
//  Patterns
//
//  Created by Vladislav Gushin on 22/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation
/*
 Декоратор (Decorator) представляет структурный шаблон проектирования, который позволяет динамически подключать к объекту дополнительную функциональность.
 Для определения нового функционала в классах нередко используется наследование. Декораторы же предоставляет наследованию более гибкую альтернативу, поскольку позволяют динамически в процессе выполнения определять новые возможности у объектов.
 Когда следует использовать декораторы?
 Когда надо динамически добавлять к объекту новые функциональные возможности. При этом данные возможности могут быть сняты с объекта
 Когда применение наследования неприемлемо. Например, если нам надо определить множество различных функциональностей и для каждой функциональности наследовать отдельный класс, то структура классов может очень сильно разрастись. Еще больше она может разрастись, если нам необходимо создать классы, реализующие все возможные сочетания добавляемых функциональностей.
 */

//Component: абстрактный класс, который определяет интерфейс для наследуемых объектов
protocol Component{
    func operation();
}

//ConcreteComponent: конкретная реализация компонента, в которую с помощью декоратора добавляется новая функциональность
class ConcreteComponentA : Component{
    func operation(){
        print("ConcreteComponent A")
    };
}
class ConcreteComponentB : Component{
    func operation(){
        print("ConcreteComponent B")
    };
}


//Decorator: собственно декоратор, реализуется в виде абстрактного класса и имеет тот же базовый класс, что и декорируемые объекты. Поэтому базовый класс Component должен быть по возможности легким и определять только базовый интерфейс.
//Класс декоратора также хранит ссылку на декорируемый объект в виде объекта базового класса Component и реализует связь с базовым классом как через наследование, так и через отношение агрегации.
protocol Decorator : Component{
    var component : Component! { get set}
    func setComponent(component : Component)
}
extension Decorator{
    func operation(){
        guard let component = component else {
            return
        }
        component.operation();
    }
}

//Классы ConcreteDecoratorA и ConcreteDecoratorB представляют дополнительные функциональности, которыми должен быть расширен объект ConcreteComponent.
class ConcreteDecoratorA : Decorator{
    var component: Component!
    func setComponent(component: Component) {
        self.component = component
    }
}
class ConcreteDecoratorB : Decorator {
    var component: Component!
    func setComponent(component: Component) {
        self.component = component
    }
}

class DecoratorClient : PClient{
    func test() {
        let concreteComponentA = ConcreteComponentA()
        let concreteComponentB = ConcreteComponentB()
        let a = ConcreteDecoratorA()
        a.setComponent(component: concreteComponentA)
        let b = ConcreteDecoratorB()
        b.setComponent(component: concreteComponentB)
        
        a.operation()
        b.operation()
    }
}
