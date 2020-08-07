protocol Creator {
    func someLogic()->String
    func factoryMethod()->Product
}

protocol Product {
    func whatIsIt ()->String
}

extension Creator {
    func someLogic ()->String {
        let product = factoryMethod()
        return "\(product.whatIsIt()) + some logic"
    }
}

class Product1: Product {
    func whatIsIt() -> String {
        return "product 1"
    }
}


class Product2: Product {
    func whatIsIt() -> String {
        return "product 2"
    }
}

class MyCreator1: Creator {
    func factoryMethod() -> Product {
        return Product1()
    }
}

class MyCreator2: Creator {
    func factoryMethod() -> Product {
        return Product2()
    }
}

class Client {
    static func someCode (creator: Creator)->String {
        return creator.someLogic()
    }
}

print(Client.someCode(creator: MyCreator1()))
print(Client.someCode(creator: MyCreator2()))

