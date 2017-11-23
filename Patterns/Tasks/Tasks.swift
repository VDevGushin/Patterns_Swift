//
//  Tasks.swift
//  Patterns
//
//  Created by Vladislav Gushin on 23/11/2017.
//  Copyright © 2017 Vladislav Gushin. All rights reserved.
//

import Foundation

//GET MAX
func flip(_ bit : Int)->Int{
    return 1^bit
}
func sign(_ a : Int)-> Int {
    return flip((a >> 31) & 0x1);
}
func getMaxNaive(a: Int,b : Int) -> Int{
    let k = sign(a - b)
    let q = flip(k);
    return a * k + b * q;
}

//Как изменить порядок элементов в строке на обратный без использования вспомогательных классов?
func stringReverce(s : String)->String{
    var a : [Character] = Array(s)
    var b = [Character]()
    for i in 1...s.count{
        b.append(a[(a.count - i)])
    }
    return String(b)
}

func Bubble(){
    var array = [5,3,4,6,8,2,9,1,7,10,11]
    var sortedArray = array
    var sortedAboveIndex = array.count
    repeat {
        var lastSwapIndex = 0
        for i in 1..<sortedAboveIndex {
            if (sortedArray[i - 1] > sortedArray[i]) {
                sortedArray[i] =  sortedArray[i-1]
                lastSwapIndex = i
            }
        }
        sortedAboveIndex = lastSwapIndex
    } while (sortedAboveIndex != 0)
}


//Число в массив
//let number = 12345678
//var res : [Int] = []
//var checker = number
//while (checker > 0){
//    res.append(checker % 10)
//    checker = Int(checker / 10)
//}
//print(res)
class TaskWithNumber {
    static let sharedTaskNumber = TaskWithNumber()
    private init(){}
    
    let number = 12345678999999
    
    func getLine()->[Int]{
        var result = [Int]()
        var del = getDelitel()
        var tmp = number
        while  del > 0 {
            result.append(tmp / del)
            tmp = Int(tmp % del)
            del = del / 10
        }
        return result
    }
    
    private func getDelitel() -> Int{
        var delitel = 0
        var tmpNumber = number
        while  tmpNumber > 0 {
            tmpNumber = Int(tmpNumber / 10)
            delitel += 1
        }
        var result = 1
        for _ in 1..<delitel{
            result = result*10
        }
        return result
    }
}
