//
//  SingleResponsibilityPrinciple.swift
//  Patterns
//
//  Created by Vladislav Gushin on 22/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation
/*
 Принцип единственной обязанности (Single Responsibility Principle) можно сформулировать так:
 У класса должна быть только одна причина для изменения
 Под обязанностью здесь понимается набор функций, которые выполняют единую задачу. Суть этого принципа заключается в том, что класс должен выполнять одну единственную задачу. Весь функционал класса должен быть целостным, обладать высокой связностью (high cohesion).
 Конкретное применение принципа зависит от контекста. В данном случае важно понимать, как изменяется класс. Если класс выполняет несколько различных функций, и они изменяются по отдельности, то это как раз тот случай, когда можно применить принцип единственной обязанности. То есть иными словами, у класса несколько причин для изменения.
 Но если же все функции класса, как правило, изменяются вместе и составляют одно функциональное целое, решают одну задачу, то нет смысла применять данный принцип.
 */

protocol IPrinter {
    func printText(text: String)
}

class ConsolePrinter: IPrinter {
    func printText(text: String) {
        print(text)
    }
}

class Report{
    let text : String
    init (text : String){
        self.text = text
    }
    
    func GoToFirstPage(){
        print("Переход к первой странице");
    }
    
    func  GoToLastPage(){
        print("Переход к последней странице");
    }
    
    func GoToPage(pageNumber:  Int ){
        print("Переход к странице \(pageNumber)")
    }
    
    func printText(printer : IPrinter){
        printer.printText(text: self.text);
    }
}

class SingleResponsibilityPrincipleClient: PClient {
    func test() {
        let report = Report(text: "Hello Wolrd")
        report.printText(printer: ConsolePrinter())
    }
}
