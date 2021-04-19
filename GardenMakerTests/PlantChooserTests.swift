//
//  PlantChooserTests.swift
//  GardenMakerTests
//
//  Created by Paul Hise on 4/19/21.
//

@testable import GardenMaker
import Nimble
import Quick
import Spry

class PlantChooserTests: QuickSpec {

    // swiftlint:disable function_body_length
    override func spec() {

        var subject: PlantChooser!

        describe("PlantChooser") {
            var gardenPlants = [GardenPlant]()

            beforeEach {
                subject = PlantChooser()
            }

            describe("getRandomGardenPlants") {

                context("when the count is 0") {

                    beforeEach {
                        gardenPlants = subject.getRandomGardenPlants(count: 0)
                    }

                    it("should return an empty GardenPlant array") {
                        expect(gardenPlants).to(beEmpty())
                    }
                }

                context("when the count is greater than 0") {

                    beforeEach {
                        gardenPlants = subject.getRandomGardenPlants(count: 5)
                    }

                    it("should return the correct number of plants in the array") {
                        expect(gardenPlants).toNot(beEmpty())
                        expect(gardenPlants.count).to(equal(5))
                    }
                }
            }

            describe("getPlants") {

                context("when the plantTypes parameter is an empty array") {

                    beforeEach {
                        gardenPlants = subject.getGardenPlants(plantTypes: [])
                    }

                    it("should return an empty GardenPlant array") {
                        expect(gardenPlants).to(beEmpty())
                    }
                }

                context("when the plantTypes parameter contains plantTypes (is NOT an empty array)") {

                    beforeEach {
                        gardenPlants = subject.getGardenPlants(plantTypes: [.cactus, .vegtable, .flower])
                    }

                    it("should return a GardenPlant array with the correct elements") {
                        expect(gardenPlants).toNot(beEmpty())
                        expect(gardenPlants).to(contain(GardenPlant(plantType: .cactus)))
                        expect(gardenPlants).to(contain(GardenPlant(plantType: .vegtable)))
                        expect(gardenPlants).to(contain(GardenPlant(plantType: .flower)))
                    }
                }
            }
        }
    }
}
