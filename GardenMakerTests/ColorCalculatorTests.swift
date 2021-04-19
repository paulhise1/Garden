//
//  ColorCalculatorTests.swift
//  ProjectTests
//
//  Created by Paul Hise on 4/16/21.
//

@testable import GardenMaker
import Nimble
import Quick
import Spry

class ColorCalculatorTests: QuickSpec {

    // swiftlint:disable function_body_length
    override func spec() {

        var subject: ColorCalculator!

        describe("ColorChooser") {

            beforeEach {
                subject = ColorCalculator()
            }

            describe("getColorsForPlants") {
                var plantColors: [Color] = []
                
                context("when the plant is a cactus") {

                    beforeEach {
                        let plants = [GardenPlant(plantType: .cactus)]
                        plantColors = subject.getColorsForPlants(gardenPlants: plants)
                    }

                    it("should return the correct colors containing only green") {
                        expect(plantColors.count).to(equal(1))
                        expect(plantColors).to(contain(Color.green))
                    }
                }

                context("when the plant is a tree") {
                    beforeEach {
                        let plants = [GardenPlant(plantType: .tree)]
                        plantColors = subject.getColorsForPlants(gardenPlants: plants)
                    }

                    it("should return the correct colors containing brown and green only") {
                        expect(plantColors.count).to(equal(2))
                        expect(plantColors).to(contain(Color.green))
                        expect(plantColors).to(contain(Color.brown))
                    }
                }

                context("when the plant is a shrub") {

                    beforeEach {
                        let plants = [GardenPlant(plantType: .shrub)]
                        plantColors = subject.getColorsForPlants(gardenPlants: plants)
                    }

                    it("should return the correct colors containing brown and green only") {
                        expect(plantColors.count).to(equal(2))
                        expect(plantColors).to(contain(Color.green))
                        expect(plantColors).to(contain(Color.brown))
                    }
                }

                context("when the plant is a flower") {

                    beforeEach {
                        let plants = [GardenPlant(plantType: .flower)]
                        plantColors = subject.getColorsForPlants(gardenPlants: plants)
                    }

                    it("should return the correct colors containing red, yellow, green, blue, purple, and organe only") {
                        expect(plantColors.count).to(equal(6))
                        expect(plantColors).to(contain(Color.red))
                        expect(plantColors).to(contain(Color.yellow))
                        expect(plantColors).to(contain(Color.green))
                        expect(plantColors).to(contain(Color.blue))
                        expect(plantColors).to(contain(Color.purple))
                        expect(plantColors).to(contain(Color.orange))
                    }
                }

                context("when the plant is a vegtable") {

                    beforeEach {
                        let plants = [GardenPlant(plantType: .vegtable)]
                        plantColors = subject.getColorsForPlants(gardenPlants: plants)
                    }

                    it("should return the correct colors containing red, yellow, green, blue, purple, and organe only") {
                        expect(plantColors.count).to(equal(6))
                        expect(plantColors).to(contain(Color.red))
                        expect(plantColors).to(contain(Color.yellow))
                        expect(plantColors).to(contain(Color.green))
                        expect(plantColors).to(contain(Color.blue))
                        expect(plantColors).to(contain(Color.purple))
                        expect(plantColors).to(contain(Color.orange))
                    }
                }

                context("when the plant is a grass") {

                    beforeEach {
                        let plants = [GardenPlant(plantType: .grass)]
                        plantColors = subject.getColorsForPlants(gardenPlants: plants)
                    }

                    it("should return the correct colors containing only green") {
                        expect(plantColors.count).to(equal(1))
                        expect(plantColors).to(contain(Color.green))
                    }
                }

                context("when the plant is a vine") {

                    beforeEach {
                        let plants = [GardenPlant(plantType: .vine)]
                        plantColors = subject.getColorsForPlants(gardenPlants: plants)
                    }

                    it("should return the correct colors containing only green") {
                        expect(plantColors.count).to(equal(1))
                        expect(plantColors).to(contain(Color.green))
                    }
                }
            }

            describe("getColorsForGnomes") {
                var plantColors: [Color] = []

                context("when there are 0 gnomes") {

                    beforeEach {
                        plantColors = subject.getColorsForGnomes(numberOfGnomes: 0)
                    }

                    it("should return and empty array of colors") {
                        expect(plantColors).to(beEmpty())
                    }
                }

                context("when there is 1 gnome") {

                    beforeEach {
                        plantColors = subject.getColorsForGnomes(numberOfGnomes: 1)
                    }

                    it("should return an array of colors with a single element") {
                        expect(plantColors).toNot(beEmpty())
                        expect(plantColors.count).to(equal(1))
                    }
                }

                context("when there is more than 1 gnome") {

                    beforeEach {
                        plantColors = subject.getColorsForGnomes(numberOfGnomes: 6)
                    }

                    it("should return an array of colors with 6 elements") {
                        expect(plantColors).toNot(beEmpty())
                        expect(plantColors.count).to(equal(6))
                    }
                }
            }
        }
    }
}
