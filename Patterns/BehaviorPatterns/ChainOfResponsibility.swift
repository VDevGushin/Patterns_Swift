//
//  ChainOfResponsibility.swift
//  Patterns
//
//  Created by Vladislav Gushchin on 23/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation

/*Цепочка Обязанностей (Chain of responsibility) - поведенческий шаблон проектирования, который позволяет избежать жесткой привязки отправителя запроса к получателю, позволяя нескольким объектам обработать запрос. Все возможные обработчики запроса образуют цепочку, а сам запрос перемещается по этой цепочке, пока один из ее объектов не обработает запрос. Каждый объект при получении запроса выбирает, либо обработать запрос, либо передать выполнение запроса следующему по цепочке.
 Когда применяется цепочка обязанностей?
 Когда имеется более одного объекта, который может обработать определенный запрос
 Когда надо передать запрос на выполнение одному из нескольких объект, точно не определяя, какому именно объекту
 Когда набор объектов задается динамически*/

//HandlerReq: определяет интерфейс для обработки запроса. Также может определять ссылку на следующий обработчик запроса
protocol HandlerReq{
    var successor: HandlerReq?{get set}
    func handlerRequest(condition : Int)
}


/*ConcreteHandler1 и ConcreteHandler2: конкретные обработчики, которые реализуют функционал для обработки запроса. При невозможности обработки и наличия ссылки на следующий обработчик, передают запрос этому обработчику
 
 В данном случае для простоты примера в качестве параметра передается некоторое число, и в зависимости от значения данного числа обработчики и принимают решения об обработке запроса.*/
class ConcreteHandlerReq_One : HandlerReq{
    var successor: HandlerReq?
    func handlerRequest(condition : Int){
        if condition == 1{
            print("Обработка 1")
        }else {
            if let successor = successor{
                successor.handlerRequest(condition: condition)
            }
        }
    }
}

class ConcreteHandlerReq_Two : HandlerReq{
    var successor: HandlerReq?
    func handlerRequest(condition : Int){
        if condition == 2{
            print("Обработка 2")
        }else {
            if let successor = successor{
                successor.handlerRequest(condition: condition)
            }
        }
    }
}

//ChainOfResponsibilityClient: отправляет запрос объекту Handler
class ChainOfResponsibilityClient{
    func test(){
        let h1 = ConcreteHandlerReq_One()
        let h2 = ConcreteHandlerReq_Two()
        h1.successor = h2
        h1.handlerRequest(condition: 2)
    }
}
extension ChainOfResponsibilityClient : PClient{}
