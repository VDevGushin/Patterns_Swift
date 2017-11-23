//
//  Visitor.swift
//  Patterns
//
//  Created by Vladislav Gushchin on 23/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation

/*
 Паттерн Посетитель (Visitor) позволяет определить операцию для объектов других классов без изменения этих классов.
 При использовании паттерна Посетитель определяются две иерархии классов: одна для элементов, для которых надо определить новую операцию, и вторая иерархия для посетителей, описывающих данную операцию.
 Когда использовать данный паттерн?
 Когда имеется много объектов разнородных классов с разными интерфейсами, и требуется выполнить ряд операций над каждым из этих объектов
 Когда классам необходимо добавить одинаковый набор операций без изменения этих классов
 Когда часто добавляются новые операции к классам, при этом общая структура классов стабильна и практически не изменяется
 */

//Visitor: интерфейс посетителя, который определяет метод Visit() для каждого объекта Element
protocol Visitor{
    func visitElementA(elemA : ElementA);
    func visitElementB(elemB : ElementB);
}

//ConcreteVisitor1 / ConcreteVisitor2: конкретные классы посетителей, реализуют интерфейс, определенный в Visitor.
class ConcreteVisitor1 : Visitor
{
    func visitElementA(elemA :ElementA){
        elemA.operationA();
    }
    func visitElementB(elemB : ElementB){
        elemB.operationB();
    }
}

class ConcreteVisitor2 : Visitor
{
    func visitElementA(elemA :ElementA){
        elemA.operationA();
    }
    func visitElementB(elemB : ElementB){
        elemB.operationB();
    }
}

//Element: определяет метод Accept(), в котором в качестве параметра принимается объект Visitor
protocol Element{
    func accept(visitor : Visitor)
    var someState : String { get set }
    init( someState : String)
}

//ElementA / ElementB: конкретные элементы, которые реализуют метод Accept()
class ElementA : Element{
    var someState: String
    required init( someState : String){
        self.someState = someState
    }
    func accept(visitor : Visitor){
        visitor.visitElementA(elemA: self);
    }
    func operationA(){print("operationA") }
}

class ElementB : Element{
    var someState: String
    required init( someState : String){
        self.someState = someState
    }
    func accept(visitor : Visitor){
        visitor.visitElementB(elemB: self);
    }
    func operationB(){ print("operationB")}
}

//ObjectStructure: некоторая структура, которая хранит объекты Element и предоставляет к ним доступ. Это могут быть и простые списки, и сложные составные структуры в виде деревьев
class ObjectStructure{
    var  elements = [Element]()
    var visitor : Visitor!
    func add(element : Element ){
        elements.append(element)
    }
    ///func remove(element : Element )
    func accept(visitor : Visitor){
        self.visitor = visitor
        for element in elements{
            element.accept(visitor: visitor)
        }
    }
}

class VisitorClient: PClient{
    func test() {
        
        let structure = ObjectStructure();
        structure.add(element: ElementA(someState: "aState"));
        structure.add(element: ElementB(someState: "bState"));
        structure.accept(visitor: ConcreteVisitor1());
        structure.accept(visitor: ConcreteVisitor2());
    
        let a = ElementA(someState: "aState")
        let b = ElementB(someState: "bState")
        let v = ConcreteVisitor1()
        v.visitElementA(elemA: a)
        v.visitElementB(elemB: b)
        let v2 = ConcreteVisitor2()
        v2.visitElementA(elemA: a)
        v2.visitElementB(elemB: b)
    }
}

