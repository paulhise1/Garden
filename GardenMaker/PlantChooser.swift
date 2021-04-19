//
//  PlantChooser.swift
//  Garden
//
//  Created by Paul Hise on 4/19/21.
//

import Foundation

struct GardenPlant: Equatable {
    internal enum PlantType {
        case cactus
        case tree
        case shrub
        case flower
        case vegtable
        case grass
        case vine
    }

    internal static let allPlantTypes: [PlantType] = [.cactus, .tree, .shrub, .flower, .vegtable, .grass, .vine]

    internal var plantType: PlantType
}

class PlantChooser {

    internal func getRandomGardenPlants(count: Int) -> [GardenPlant] {
        var plants = [GardenPlant]()
        for _ in 0..<count {
            plants.append(GardenPlant(plantType: GardenPlant.allPlantTypes.randomElement() ?? .flower))
        }
        return plants
    }

    internal func getGardenPlants(plantTypes: [GardenPlant.PlantType]) -> [GardenPlant] {
        var plants = [GardenPlant]()
        for plantType in plantTypes {
            plants.append(GardenPlant(plantType: plantType))
        }
        return plants
    }
}
