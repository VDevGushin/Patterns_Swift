//
//  Observer.swift
//  Patterns
//
//  Created by Vladislav Gushchin on 23/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation
/*Паттерн "Наблюдатель" (Observer) представляет поведенческий шаблон проектирования, который использует отношение "один ко многим". В этом отношении есть один наблюдаемый объект и множество наблюдателей. И при изменении наблюдаемого объекта автоматически происходит оповещение всех наблюдателей.
 Данный паттерн еще называют Publisher-Subscriber (издатель-подписчик), поскольку отношения издателя и подписчиков характеризуют действие данного паттерна: подписчики подписываются email-рассылку определенного сайта. Сайт-издатель с помощью email-рассылки уведомляет всех подписчиков о изменениях. А подписчики получают изменения и производят определенные действия: могут зайти на сайт, могут проигнорировать уведомления и т.д.
 Когда использовать паттерн Наблюдатель?
 Когда система состоит из множества классов, объекты которых должны находиться в согласованных состояниях
 Когда общая схема взаимодействия объектов предполагает две стороны: одна рассылает сообщения и является главным, другая получает сообщения и реагирует на них. Отделение логики обеих сторон позволяет их рассматривать независимо и использовать отдельно друга от друга.
 Когда существует один объект, рассылающий сообения, и множество подписчиков, которые получают сообщения. При этом точное число подписчиков заранее неизвестно и процессе работы программы может изменяться.*/


//PObservable: представляет наблюдаемый объект. Определяет три метода: AddObserver() (для добавления наблюдателя), RemoveObserver() (удаление набюдателя) и NotifyObservers() (уведомление наблюдателей)
protocol PObservable{
    func addObserver(o: PObserver);
    func removeObserver(o: PObserver);
    func notifyObservers();
}

//IObserver: представляет наблюдателя, который подписывается на все уведомления наблюдаемого объекта. Определяет метод Update(), который вызывается наблюдаемым объектом для уведомления наблюдателя.
protocol PObserver : class{
    var id : Int{get set}
    func update();
}

//ConcreteObservable: конкретная реализация интерфейса IObservable. Определяет коллекцию объектов наблюдателей.
class ConcreteObserver : PObserver{
    var id : Int
    init(id : Int){
        self.id = id
    }
    func update(){
        print("\(id) get signals")
    }
}

//ConcreteObserver: конкретная реализация интерфейса IObserver.
class ConcreteObservable : PObservable{
    var observers : [PObserver];
    init(){
        observers = []
    }
    
    func addObserver(o: PObserver){
        observers.append(o)
    }
    
    private func find(_ o: PObserver)->Int?{
        for i in 0..<observers.count{
            if observers[i].id == o.id{
                return i
            }
        }
        return nil
    }
    
    func removeObserver(o: PObserver){
        if let i = find(o) {
            observers.remove(at: i)
        }
    }
    
    func notifyObservers(){
        for o in observers{
            o.update()
        }
    }
}

class ObservableClient : PClient {
    func test() {
        let ob = ConcreteObservable()
        let o1 = ConcreteObserver(id: 1)
        let o2 = ConcreteObserver(id: 2)
        ob.addObserver(o: o1)
        ob.addObserver(o: o2)
        ob.notifyObservers()
    }
}
