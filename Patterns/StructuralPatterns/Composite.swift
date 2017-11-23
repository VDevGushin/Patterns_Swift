//
//  Composite.swift
//  Patterns
//
//  Created by Vladislav Gushin on 22/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation
/*
 Паттерн Компоновщик (Composite) объединяет группы объектов в древовидную структуру по принципу "часть-целое и позволяет клиенту одинаково работать как с отдельными объектами, так и с группой объектов.
 Образно реализацию паттерна можно представить в виде меню, которое имеет различные пункты. Эти пункты могут содержать подменю, в которых, в свою очередь, также имеются пункты. То есть пункт меню служит с одной стороны частью меню, а с другой стороны еще одним меню. В итоге мы однообразно можем работать как с пунктом меню, так и со всем меню в целом.

 Когда использовать компоновщик?
 Когда объекты должны быть реализованы в виде иерархической древовидной структуры
 Когда клиенты единообразно должны управлять как целыми объектами, так и их составными частями. То есть целое и его части должны реализовать один и тот же интерфейс
 */

//PComponent: определяет интерфейс для всех компонентов в древовидной структуре
protocol PComponent {
    var name: String { get set }
    init (name: String)
    func display()
    func add(c: PComponent)
    func remove(c: PComponent)
}

//Composite: представляет компонент, который может содержать другие компоненты и реализует механизм для их добавления и удаления
class Composite: PComponent {
    var children = [PComponent]()
    var name: String

    required init(name: String) {
        self.name = name
    }

    func display() {
        for item in self.children {
            item.display()
        }
    }
    
    func add(c: PComponent) {
        children.append(c)
    }

    func remove(c: PComponent) {
        var index: Int?
        for i in 0..<self.children.count {
            if self.children[i].name == c.name {
                index = i
                break
            }
        }
        if let index = index {
            children.remove(at: index)
        }
    }
}

//Leaf: представляет отдельный компонент, который не может содержать другие компоненты
class Leaf: PComponent {
    var name: String
    required init(name: String) {
        self.name = name
    }
    func display() {
        print(self.name)
    }
    func add(c: PComponent) {}
    func remove(c: PComponent) {}
}

//Client: клиент, который использует компоненты
class CompositeClient: PClient {
    func test() {
        let root = Composite(name: "Root");
        let leaf = Leaf(name: "Leaf");
        let subtree = Composite(name: "Subtree");
        root.add(c: leaf);
        root.add(c: subtree);
        root.display();
    }
}
