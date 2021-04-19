//
//  FakeColorCalculator.swift
//  GardenMakerTests
//
//  Created by Paul Hise on 4/19/21.
//

import Foundation
@testable import GardenMaker
import Spry

class FakeColorCalculator: ColorCalculator, Spryable {

    enum Function: String, StringRepresentable {
        case getColorsForPlants = "getColorsForPlants(gardenPlants:)"
        case getColorsForGnomes = "getColorsForGnomes(numberOfGnomes:)"
    }

    enum ClassFunction: String, StringRepresentable {
        case nothing
    }

    // MARK: - overrides -

    override func getColorsForPlants(gardenPlants: [GardenPlant]) -> [Color] {
        return spryify(arguments: gardenPlants)
    }

    override func getColorsForGnomes(numberOfGnomes: Int) -> [Color] {
        return spryify(arguments: numberOfGnomes)
    }
}
