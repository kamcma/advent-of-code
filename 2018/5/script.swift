#!/usr/bin/swift

import Foundation

let input = try String(contentsOfFile: "input.txt").trimmingCharacters(in: ["\n"])

func areReactive(_ char1: Character, _ char2: Character) -> Bool {
    return char1 != char2 && String(char1).uppercased() == String(char2).uppercased()
}

let result = input.reduce([], { (acc, elem) -> [Character] in
    if case let head? = acc.first, areReactive(head, elem) {
        return Array(acc[1..<acc.count])
    }
    return [elem] + acc
}).count

print(result)
