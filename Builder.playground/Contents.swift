protocol IHouse {
    var hasSwim: Bool {get set}
    var hasGarden: Bool {get set}
    var hasGarage: Bool {get set}
}


protocol IHouseBuilder {
    func setSwim() -> Void
    func setGarden() -> Void
    func setGarage() -> Void
    func getResult()-> House
    func reset() -> Void
    var house: House {set get}
}


class House: IHouse {
    var hasSwim: Bool
    var hasGarden: Bool
    var hasGarage: Bool
    
    init() {
        hasGarage = false
        hasSwim = false
        hasGarden = false
    }
}

//extension IHouseBuilder {
////    mutating func reset() {
////        house = House()
////    }
//
//    func getResult ()->House {
//        return house
//    }
//}

/**
 House wood
 */
class HouseBuilderWood: IHouseBuilder {
    func reset() {
        house = House()
    }
    
    func getResult ()->House {
        return house
    }
    
    var house: House
    
    init() {
        house = House()
    }
    
    func setSwim() -> Void {
        print("swim wood")
        self.house.hasSwim = true
    }
    
    func setGarage() {
        print("garage wood")
        self.house.hasGarage = true
    }
    
    func setGarden() {
        print("garden wood")
        self.house.hasGarden = true
    }
}

/**
 House stelle
 */
class HouseBuilderStelle: IHouseBuilder {
    func reset() {
        house = House()
    }
    
    func getResult ()->House {
        return house
    }
    
    var house: House
    
    init() {
        house = House()
    }
    
    func setSwim() -> Void {
        print("swim stelle")
        self.house.hasSwim = true
    }
    
    func setGarage() {
        print("garage stelle")
        self.house.hasGarage = true
    }
    
    func setGarden() {
        print("garden stelle")
        self.house.hasGarden = true
    }
}


class Director {
    var builder: IHouseBuilder
    init(_ houseBuilder: IHouseBuilder) {
        builder = houseBuilder
    }
    
    func makeHouseWithGardenAndSwim()->House {
        builder.reset()
        builder.setSwim()
        builder.setGarden()
        return builder.getResult()
    }
    
    func makeHouseWithGarage()->House {
        builder.reset()
        builder.setGarage()
        return builder.getResult()
    }
}

var houseBuilderWood = HouseBuilderWood()
var houseBuilderStelle = HouseBuilderStelle()

var directorWood = Director(houseBuilderWood)
var directorStelle = Director(houseBuilderStelle)

var house1 = directorWood.makeHouseWithGarage()
var house2 = directorWood.makeHouseWithGardenAndSwim()
var house3 = directorStelle.makeHouseWithGarage()
var house4 = directorStelle.makeHouseWithGardenAndSwim()
