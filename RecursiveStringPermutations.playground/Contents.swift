//: Playground - noun: a place where people can play

import UIKit

func permutations(message: String) -> Set<String> {
    var stringArray = message.characters.map{String($0)}
    var permutations: Set<String> = []
    
    return permutations
}

var message = "cat"
//message = "{ [ ( ] ) }"
//message = "{ [ ] ( ) }"
//message = "{[(])}"
//message = "{[}"
//message = "{"
//message = "{}"
permutations(message: message)
