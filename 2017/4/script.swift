#!/usr/bin/swift

import Foundation

let input = try String(contentsOfFile: "./input.txt")

let phrases = input.split(separator: "\n").map { $0.split(separator: " ") }

// part 1

let validPhrases = phrases.filter { phrase in
    return phrase.count == Set(phrase).count
}

print(validPhrases.count)

// part 2

let validPhrases2 = phrases.filter { phrase in
    return phrase.count == Set(phrase.map { word in
        String(word.sorted())
    }).count
}

print(validPhrases2.count)
