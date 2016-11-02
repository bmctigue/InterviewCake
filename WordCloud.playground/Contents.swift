//: Playground - noun: a place where people can play

import UIKit

func wordCloud(words: String) -> [String:Int] {
    let charArray:[String] = words.characters.map{String($0)}
    let legalChars: Set<String> = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","0","1","2","3","4","5","6","7","8","9","-","'"]
    var wordCloud: [String:Int] = [:]
    var word: String = ""
    var lowerCaseChar: String = ""
    for char in charArray {
        if char == " " {
            wordCloud = addWordToCloud(word: word, cloud: wordCloud)
            word = ""
        } else {
            lowerCaseChar = char.lowercased()
            if legalChars.contains(lowerCaseChar) {
               word += char.lowercased()
            }
        }
    }
    wordCloud = addWordToCloud(word: word, cloud: wordCloud)
    return wordCloud
}

func addWordToCloud(word: String, cloud: [String:Int]) -> [String:Int] {
    var wordCloud = cloud
    var count: Int?
    if word != ""  && word != " - " && word != " ' "{
        count = wordCloud[word]
        if let count = count {
            wordCloud[word] = count + 1
        } else {
            wordCloud[word] = 1
        }
    }
    return wordCloud
}


var words = "After beating the eggs, Dana read the next step: Add milk and eggs, then add flour and hyper-loop and sugar."
//words = "We came, we saw, we conquered...then we ate Bill's (Mille-Feuille) cake."
//words = "The bill came to five dollars."
let cloud = wordCloud(words: words)
print(cloud)