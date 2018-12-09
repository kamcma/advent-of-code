#!/usr/bin/swift

import Foundation

let input = try String(contentsOfFile: "./input.txt")

let spreadsheet = input.split(separator: "\n").map({ line in
    line.split(separator: "\t").flatMap({ Int($0) })
})

// part 1

func minMaxDelta(_ arr: [Int]) -> Int {
    guard let max = arr.max(), let min = arr.min() else { return 0 }
    return max - min
}

let sum: Int = spreadsheet.reduce(0) { $0 + minMaxDelta($1) }

print(sum)

// part 2

func evenlyDivisibleQuotient(_ arr: [Int]) -> Int {
    for dividend in arr.sorted(by: >) {
        for divisor in arr {
            if dividend > divisor, dividend % divisor == 0 { return dividend / divisor }
        }
    }
    return 0
}

let sum2: Int = spreadsheet.reduce(0) { $0 + evenlyDivisibleQuotient($1) }

print(sum2)
