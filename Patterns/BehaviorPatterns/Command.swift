//
//  Command.swift
//  Patterns
//
//  Created by Vladislav Gushchin on 23/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation

/*Паттерн "Команда" (Command) позволяет инкапсулировать запрос на выполнение определенного действия в виде отдельного объекта. Этот объект запроса на действие и называется командой. При этом объекты, инициирующие запросы на выполнение действия, отделяются от объектов, которые выполняют это действие.
 
 Команды могут использовать параметры, которые передают ассоциированную с командой информацию. Кроме того, команды могут ставиться в очередь и также могут быть отменены.
 
 Когда использовать команды?
 
 Когда надо передавать в качестве параметров определенные действия, вызываемые в ответ на другие действия. То есть когда необходимы функции обратного действия в ответ на определенные действия.
 
 Когда необходимо обеспечить выполнение очереди запросов, а также их возможную отмену.
 
 Когда надо поддерживать логгирование изменений в результате запросов. Использование логов может помочь восстановить состояние системы - для этого необходимо будет использовать последовательность запротоколированных команд.*/

//Command: интерфейс, представляющий команду. Обычно определяет метод Execute() для выполнения действия, а также нередко включает метод Undo(), реализация которого должна заключаться в отмене действия команды
protocol Command{
    func execute();
    func undo();
}

//Receiver: получатель команды. Определяет действия, которые должны выполняться в результате запроса.
class Receiver{
    func Operaiton(){
        print("Start operation")
    }
}

//ConcreteCommand: конкретная реализация команды, реализует метод Execute(), в котором вызывается определенный метод, определенный в классе Receiver
class ConcreteCommand : Command{
    var receiver : Receiver
    init(receiver : Receiver){
        self.receiver = receiver
    }
    func execute(){
        receiver.Operaiton()
    }
    func undo(){}
}

//Invoker: инициатор команды - вызывает команду для выполнения определенного запроса
class Invoker{
    var command : Command?
    func setCommand(c : Command){
        self.command = c;
    }
    func run(){
        command?.execute();
    }
    func Cancel(){
        command?.undo();
    }
}

//Client: клиент - создает команду и устанавливает ее получателя с помощью метода SetCommand()
class CommandClient : PClient {
    func test() {
        let invoker = Invoker()
        let reciver = Receiver()
        let concreteCommand = ConcreteCommand(receiver: reciver)
        invoker.setCommand(c: concreteCommand)
        invoker.run()
    }
}

