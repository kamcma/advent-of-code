#!/usr/bin/swift

import Foundation

typealias CubeCoordinate = (x: Int, y: Int, z: Int)

enum Direction: String {
    case north = "n"
    case northeast = "ne"
    case southeast = "se"
    case south = "s"
    case southwest = "sw"
    case northwest = "nw"
    
    func move(_ coord: CubeCoordinate) -> CubeCoordinate {
        switch self {
        case .north:
            return CubeCoordinate(coord.x, coord.y + 1, coord.z - 1)
        case .northeast:
            return CubeCoordinate(coord.x + 1, coord.y, coord.z - 1)
        case .southeast:
            return CubeCoordinate(coord.x + 1, coord.y - 1, coord.z)
        case .south:
            return CubeCoordinate(coord.x, coord.y - 1, coord.z + 1)
        case .southwest:
            return CubeCoordinate(coord.x - 1, coord.y, coord.z + 1)
        case .northwest:
            return CubeCoordinate(coord.x - 1, coord.y + 1, coord.z)
        }
    }
}

func cubeCoordinateDistance(_ lhs: CubeCoordinate, _ rhs: CubeCoordinate) -> Int {
    let xDelta = abs(lhs.x - rhs.x)
    let yDelta = abs(lhs.y - rhs.y)
    let zDelta = abs(lhs.z - rhs.z)
    return (xDelta + yDelta + zDelta) / 2
}

let input = try String(contentsOfFile: "./input.txt")

let steps = input.split(separator: ",").flatMap { Direction(rawValue: String($0)) }

let initialPosition = CubeCoordinate(0, 0, 0)

// part one

let finalPosition = steps.reduce(initialPosition) { $1.move($0) }

print(cubeCoordinateDistance(initialPosition, finalPosition))

// part two

let maxDistance = steps.reduce((position: initialPosition, maxDistance: 0), { acc, step in
    let newPosition = step.move(acc.position)
    let distance = cubeCoordinateDistance(initialPosition, newPosition)
    return (newPosition, distance > acc.maxDistance ? distance : acc.maxDistance)
}).maxDistance

print(maxDistance)
