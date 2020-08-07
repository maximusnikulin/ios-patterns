protocol IFurniture {
    var name: String {get}
}

class VictorianSofa: IFurniture {
    var name: String = "vicorian sofa"
}

class VictorianTable: IFurniture {
    var name: String = "vicorian table"
}

class ModernSofa: IFurniture {
    var name: String = "modern sofa"
}

class ModernTable: IFurniture {
    var name: String = "modern table"
}

// TODO: need static methods
protocol AbstractFactoryFurniture {
    func createSofa()->IFurniture
    func createTable()->IFurniture
}

class VictorianFactory: AbstractFactoryFurniture {
    func createSofa()->IFurniture {
        return VictorianSofa()
    }
    func createTable()->IFurniture {
        return VictorianTable()
    }
}

class ModernFactory: AbstractFactoryFurniture {
    func createSofa()->IFurniture {
        return ModernSofa()
    }
    func createTable()->IFurniture {
        return ModernTable()
    }
}

protocol Client {
    var factory: AbstractFactoryFurniture {get}
    func buySofa() -> String
    func buyTable() -> String
}

class ClientVictorian: Client {
    func buySofa() -> String {
        return factory.createSofa().name
    }
    
    func buyTable() -> String {
        return factory.createTable().name
    }
    
    var factory: AbstractFactoryFurniture
    
    init() {
        self.factory = VictorianFactory()
    }
}

class ClientModern: Client {
    func buySofa() -> String {
        return factory.createSofa().name
    }
    
    func buyTable() -> String {
        return factory.createTable().name
    }
    
    var factory: AbstractFactoryFurniture
    
    init() {
        self.factory = ModernFactory()
    }
}
