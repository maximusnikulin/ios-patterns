protocol IDuck {
    func quack() -> Void
    func fly() -> Void
}

protocol ITurkey {
    func groose() -> Void
    func fly() -> Void
}

class MyDuck: IDuck {
    func quack() {
        print("quack duck")
    }
    
    func fly () {
        print("fly duck")
    }
}

class MyTurkey: ITurkey {
    func groose() {
        print("quack turkey")
    }
    
    func fly () {
        print("fly turkey")
    }
}

class DuckAdapter: IDuck {
    var turkey: ITurkey
    init(turkey: ITurkey) {
        self.turkey = turkey
    }
    
    func quack() {
        self.turkey.groose()
    }
    
    func fly() {
        self.turkey.fly()
    }
}

let turkey = MyTurkey()
let duck = MyDuck()
let duckTurkey = DuckAdapter(turkey: turkey)

duck.quack()
duck.fly()
duckTurkey.quack()
duckTurkey.fly()
