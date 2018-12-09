#!/usr/bin/swift

import Foundation

struct Instruction {
    let modRegister: String
    let mod: (Int, Int) -> Int
    let modValue: Int
    let condRegister: String
    let cond: (Int, Int) -> Bool
    let condValue: Int

    init?(_ modRegister: String, _ mod: String, _ modValue: String,
          _ condRegister: String, _ cond: String, _ condValue: String) {
        self.modRegister = modRegister
        if mod == "inc" {
            self.mod = (+)
        } else if mod == "dec" {
            self.mod = (-)
        } else { return nil }
        guard let modValueInt = Int(modValue) else { return nil }
        self.modValue = modValueInt
        self.condRegister = condRegister
        switch cond {
        case ">":
            self.cond = (>)
        case "<":
            self.cond = (<)
        case ">=":
            self.cond = (>=)
        case "<=":
            self.cond = (<=)
        case "!=":
            self.cond = (!=)
        case "==":
            self.cond = (==)
        default:
            return nil
        }
        guard let condValueInt = Int(condValue) else { return nil }
        self.condValue = condValueInt
    }
}

let input = try String(contentsOfFile: "./input.txt")

let lines: [[String]] = input.split(separator: "\n").map { $0.split(separator: " ").map { String($0) } }

let instructions: [Instruction] = lines.flatMap { line in
    return Instruction(line[0], line[1], line[2], line[4], line[5], line[6])
}

var registers = [String: Int]()

var maxSeenRegisterValue = 0

instructions.forEach { instruction in
    if instruction.cond(registers[instruction.condRegister] ?? 0, instruction.condValue) {
        let existingValue: Int = registers[instruction.modRegister] ?? 0
        let newValue: Int = instruction.mod(existingValue, instruction.modValue)
        registers.updateValue(newValue, forKey: instruction.modRegister)
    }
    let maxRegisterValue = registers.values.max() ?? 0
    if maxRegisterValue > maxSeenRegisterValue {
        maxSeenRegisterValue = maxRegisterValue
    }
}

// part one

print(registers.values.max() ?? 0)

// part two

print(maxSeenRegisterValue)
