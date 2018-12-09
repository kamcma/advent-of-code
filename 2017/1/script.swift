#!/usr/bin/swift

import Foundation

let input = try String(contentsOfFile: "./input.txt")

let digits = Array(input).flatMap({ Int(String($0)) })

// part 1

let sum = digits.enumerated().filter({
    $0.element == digits[($0.offset + 1) % digits.count]
}).reduce(0) { $0 + $1.element }

print(sum)

// part 2

let sum2 = digits.enumerated().filter({
    $0.element == digits[($0.offset + (digits.count / 2)) % digits.count]
}).reduce(0) { $0 + $1.element }

print(sum2)
