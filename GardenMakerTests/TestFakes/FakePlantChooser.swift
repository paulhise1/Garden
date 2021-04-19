//
//  FakePlantChooser.swift
//  GardenMakerTests
//
//  Created by Paul Hise on 4/19/21.
//

import Foundation
@testable import GardenMaker
import Spry

class FakePlantChooser: PlantChooser, Spryable {

    enum Function: String, StringRepresentable {
        case getRandomGardenPlants = "getRandomGardenPlants(count:)"
        case getGardenPlants = "getGardenPlants(plantTypes:)"
    }

    enum ClassFunction: String, StringRepresentable {
        case nothing
    }

    // MARK: - overrides -

    override func getRandomGardenPlants(count: Int) -> [GardenPlant] {
        return spryify(arguments: count)
    }

    override func getGardenPlants(plantTypes: [GardenPlant.PlantType]) -> [GardenPlant] {
        return spryify(arguments: plantTypes)
    }
}
