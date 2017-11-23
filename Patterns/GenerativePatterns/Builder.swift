//
//  Builder.swift
//  Patterns
//
//  Created by Vladislav Gushin on 22/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation
/*
 Строитель (Builder) - шаблон проектирования, который инкапсулирует создание объекта и позволяет разделить его на различные этапы.
 Когда использовать паттерн Строитель?
 Когда процесс создания нового объекта не должен зависеть от того, из каких частей этот объект состоит и как эти части связаны между собой
 Когда необходимо обеспечить получение различных вариаций объекта в процессе его создания
 */

//Builder: определяет интерфейс для создания различных частей объекта Product
protocol Builder {
    func buildPartA()
    func buildPartB()
    func buildPartC()
    func getResult() -> BuilderProduct
}

//Director: распорядитель - создает объект, используя объекты Builder
class Director{
    let builder : Builder
    init(builder : Builder){
        self.builder = builder
    }
    func construct(){
        builder.buildPartA()
        builder.buildPartB()
        builder.buildPartC()
    }
}

//BuilderProduct: представляет объект, который должен быть создан. В данном случае все части объекта заключены в списке parts.
class BuilderProduct{
    var parts = [String]()
    func add(_ part : String){
        parts.append(part)
    }
    func log(){
        print(parts)
    }
}

//ConcreteBuilder: конкретная реализация Buildera. Создает объект Product и определяет интерфейс для доступа к нему
class ConcreteBuilder: Builder{
    private let product = BuilderProduct()
    func buildPartA(){
         product.add("Part A")
    }
    func buildPartB(){
        product.add("Part B")
    }
    func buildPartC(){
         product.add("Part C")
    }
    func getResult() -> BuilderProduct{
        return product
    }
}

class BuilderClient : PClient {
    func test() {
        let builder = ConcreteBuilder()
        let director = Director(builder: builder)
        director.construct()
        let product = builder.getResult()
        product.log()
    }
}

