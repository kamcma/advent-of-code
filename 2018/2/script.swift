#!/usr/bin/swift

import Foundation

let input = try String(contentsOfFile: "input.txt")

let strings = input
    .split(separator: "\n")
    .map(String.init)

let exactlyTwos: [String] = strings.filter { string in
    Dictionary(string.lazy.map { ($0, 1) }, uniquingKeysWith: +)
        .values
        .contains(2)
}

let exactlyThrees: [String] = strings.filter { string in
    Dictionary(string.lazy.map { ($0, 1) }, uniquingKeysWith: +)
        .values
        .contains(3)
}

let hash = exactlyTwos.count * exactlyThrees.count

print(hash)

let commonLettersString = strings.lazy.first { string1 in
    strings.lazy.contains { string2 in
        let commonLetters: [Character] = zip(string1, string2)
            .reduce([]) { acc, letterPair in
                let (letter1, letter2) = letterPair
                if letter1 == letter2 {
                    return acc + [letter1]
                }
                return acc
            }
        if commonLetters.count == string2.count - 1 {
            print(String(commonLetters))
        }
        return commonLetters.count == string2.count - 1
    }
}
