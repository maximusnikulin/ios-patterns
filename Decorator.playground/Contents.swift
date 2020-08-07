protocol Beverage {
    func cost()->Int
    func getDesc() -> String
}

class Coffee: Beverage {
    func cost()->Int {
        return 30
    }
    
    func getDesc ()->String {
        return "My hot cofee"
    }
}

protocol DecoratorBeverage: Beverage {
    var decoratedComp: Beverage {get}
}

class DecoratorWithMilk: DecoratorBeverage {
    var decoratedComp: Beverage
    
    func cost() -> Int {
        return decoratedComp.cost() + 5
    }
    
    func getDesc() -> String {
        return decoratedComp.getDesc() + " with Milk"
    }
    
    init(beverage: Beverage) {
        self.decoratedComp = beverage
    }
}

class Client {
    func buyCofee()->Beverage {
        let coffee = Coffee()
        let coffeeWithMilk = DecoratorWithMilk(beverage: coffee)
        print(coffeeWithMilk.getDesc())
        return coffeeWithMilk
    }
}

let client = Client()
client.buyCofee()
