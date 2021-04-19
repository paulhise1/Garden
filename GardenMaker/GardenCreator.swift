//
//  GardenCreator.swift
//  Garden
//
//  Created by Paul Hise on 4/19/21.
//

import Foundation

internal struct Garden: Equatable {
    let plants: [GardenPlant]
    let numberOfGnomes: Int
    let colorPalette: [Color]
}

class GardenCreator {

    let plantChooser: PlantChooser
    let colorChooser: ColorCalculator

    init(plantChooser: PlantChooser, colorChooser: ColorCalculator) {
        self.plantChooser = plantChooser
        self.colorChooser = colorChooser
    }

    internal func createNewGarden(userChosenPlantTypes: [GardenPlant.PlantType],
                                  numberOfRandomPlants: Int,
                                  numberOfGardenGnomes: Int) -> Garden {
        let gardenPlants = createPlants(userChosenPlantTypes: userChosenPlantTypes,
                          numberOfRandomPlants: numberOfRandomPlants)
        let colorPalette = createColorPalette(gardenPlants: gardenPlants, numberOfGnomes: numberOfGardenGnomes)
        return Garden(plants: gardenPlants,
                      numberOfGnomes: numberOfGardenGnomes,
                      colorPalette: colorPalette)
    }
}

extension GardenCreator {

    private func createPlants(userChosenPlantTypes: [GardenPlant.PlantType],
                              numberOfRandomPlants: Int) -> [GardenPlant] {
        var plants = [GardenPlant]()
        plants.append(contentsOf: plantChooser.getGardenPlants(plantTypes: userChosenPlantTypes))
        plants.append(contentsOf: plantChooser.getRandomGardenPlants(count: numberOfRandomPlants))
        return plants
    }

    private func createColorPalette(gardenPlants: [GardenPlant], numberOfGnomes: Int) -> [Color] {
        var colors = [Color]()
        colors.append(contentsOf: colorChooser.getColorsForPlants(gardenPlants: gardenPlants))
        colors.append(contentsOf: colorChooser.getColorsForGnomes(numberOfGnomes: numberOfGnomes))
        return colors
    }
}
