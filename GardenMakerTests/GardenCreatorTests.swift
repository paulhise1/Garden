//
//  GardenCreatorTests.swift
//  GardenMakerTests
//
//  Created by Paul Hise on 4/19/21.
//

@testable import GardenMaker
import Nimble
import Quick
import Spry

class GardenCreatorTests: QuickSpec {

    // swiftlint:disable function_body_length
    override func spec() {

        var subject: GardenCreator!

        var plantChooser: FakePlantChooser!
        var colorCalulator: FakeColorCalculator!

        describe("GardenCreator") {

            beforeEach {
                plantChooser = FakePlantChooser()
                colorCalulator = FakeColorCalculator()

                subject = GardenCreator(plantChooser: plantChooser, colorChooser: colorCalulator)
            }

            describe("createNewGarden") {

                var garden: Garden!
                let chosenPlantTypes: [GardenPlant.PlantType] = [.vine, .shrub, .grass]

                beforeEach {
                    plantChooser.stub(.getGardenPlants).andReturn([GardenPlant(plantType: .vine),
                                                                   GardenPlant(plantType: .shrub),
                                                                   GardenPlant(plantType: .grass)])
                    plantChooser.stub(.getRandomGardenPlants).andReturn([GardenPlant(plantType: .tree)])
                    colorCalulator.stub(.getColorsForPlants).andReturn([Color.green, Color.brown, Color.green, Color.brown, Color.green, Color.green, Color.brown])
                    colorCalulator.stub(.getColorsForGnomes).andReturn([Color.red, Color.black, Color.ochre])

                    garden = subject.createNewGarden(userChosenPlantTypes: chosenPlantTypes,
                                            numberOfRandomPlants: 1,
                                            numberOfGardenGnomes: 3)
                }

                it("should call getGardenPlants on the plantChooser") {
                    expect(plantChooser).to(haveReceived(.getGardenPlants, with: chosenPlantTypes))
                }

                it("should call getRandomGardenPlants on the plantChooser") {
                    expect(plantChooser).to(haveReceived(.getRandomGardenPlants, with: 1))
                }

                fit("should return a garden with the correct properties") {
                    let expectedPlants = [GardenPlant(plantType: .vine),
                                          GardenPlant(plantType: .shrub),
                                          GardenPlant(plantType: .grass),
                                          GardenPlant(plantType: .tree)]
                    let expectedColors = [Color.green, Color.brown, Color.green, Color.brown, Color.green, Color.green, Color.brown, Color.red, Color.black, Color.ochre]
                    let expectedGarden = Garden(plants: expectedPlants,
                                                numberOfGnomes: 3,
                                                colorPalette: expectedColors)
                    expect(garden.plants).to(equal(expectedPlants))
                    expect(garden.numberOfGnomes).to(equal(3))
                    expect(garden.colorPalette.count).to(equal(10))
                    expect(garden.colorPalette).to(equal(expectedColors))
                    expect(garden).to(equal(expectedGarden))
                }
            }
        }
    }
}
