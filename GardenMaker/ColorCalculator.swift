//
//  ColorChooser.swift
//  TestForSpry
//
//  Created by Paul Hise on 4/16/21.
//

import Foundation

internal enum Color {
    case red
    case yellow
    case green
    case brown
    case blue
    case purple
    case indigo
    case ochre
    case orange
    case black
}

class ColorCalculator {

    internal func getColorsForPlants(gardenPlants: [GardenPlant]) -> [Color] {
        var colors = [Color]()

        for plant in gardenPlants {
            switch plant.plantType {
            case .cactus, .grass, .vine:
                colors =  [.green]
            case .tree, .shrub:
                colors = [.brown, .green]
            case .flower, .vegtable:
                colors = [.red, .yellow, .green, .blue, .purple, .orange]
            }
        }

        return colors
    }

    internal func getColorsForGnomes(numberOfGnomes: Int) -> [Color] {
        let allColors: [Color] = [.red,
                                  .yellow,
                                  .green,
                                  .brown,
                                  .blue,
                                  .purple,
                                  .indigo,
                                  .ochre,
                                  .orange,
                                  .black]
        var colors = [Color]()
        for _ in 0..<numberOfGnomes {
            colors.append(allColors.randomElement() ?? .black)
        }
        return colors
    }
}
