#!/usr/bin/swift

import Foundation

let input = try String(contentsOfFile: "input.txt")

let numbers = input
    .split(separator: "\n")
    .map(String.init)
    .compactMap(Int.init)

let sum = numbers.reduce(0, +)

print(sum)
