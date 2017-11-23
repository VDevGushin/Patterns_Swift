//
//  TemplateMethod.swift
//  Patterns
//
//  Created by Vladislav Gushchin on 23/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation

/*
 Шаблонный метод (Template Method) определяет общий алгоритм поведения подклассов, позволяя им переопределить отдельные шаги этого алгоритма без изменения его структуры.
 
 Когда использовать шаблонный метод?
 
 Когда планируется, что в будущем подклассы должны будут переопределять различные этапы алгоритма без изменения его структуры
 
 Когда в классах, реализующим схожий алгоритм, происходит дублирование кода. Вынесение общего кода в шаблонный метод уменьшит его дублирование в подклассах.
 */

/*AbstractClass: определяет шаблонный метод TemplateMethod(), который реализует алгоритм. Алгоритм может состоять из последовательности вызовов других методов, часть из которых может быть абстрактными и должны быть переопределены в классах-наследниках. При этом сам метод TemplateMethod(), представляющий структуру алгоритма, переопределяться не должен.*/

protocol AbsClass{
    func op1()
    func op2()
}

extension AbsClass{
    func templateMetod(){
        op1()
        op2()
    }
}

//ConcreteClass: подкласс, который может переопределять различные методы родительского класса.
class ConcreteClassSM_ONE : AbsClass{
    func op1(){
        print("O1")
    }
    func op2(){
        print("O1")
    }
    func templateMetod(){
        op1()
    }
}

class ConcreteClassSM_TWO : AbsClass{
    func op1(){ print("T2O1")}
    func op2(){ print("T2O2")}
}

class TemplateMethodClient : PClient {
    func test() {
        let t = ConcreteClassSM_TWO()
        t.templateMetod()
    }
}
