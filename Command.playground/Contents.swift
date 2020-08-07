protocol ICommand {
    func execute () -> Void
    func undo () -> Void
}

/**
 Reciever
 */
protocol ILight {
    func on () -> Void
    func off () -> Void
}

protocol IGarageDoor {
    func lightOn () -> Void
    func up () -> Void
    func down () -> Void
    func signalOn () -> Void
}

class Light: ILight {
    func on () {
        print("Light: Light On")
    }
    
    func off () {
        print("Light: Light Off")
    }
}

class GarageDoor:IGarageDoor {
    func lightOn () {
        print("GarageDoor: Light On")
    }
    func up () {
        print("GarageDoor: Up Doors")
    }
    func down () {
        print("GarageDoor: Down Doors")
    }
    func signalOn () {
        print("GarageDoor: Signal On")
    }
}

struct GarageOpenDoorCommand: ICommand {
    func undo() {
        garageDoor.down()
    }
    
    var garageDoor: GarageDoor!
    func execute() {
        garageDoor.up()
    }
    
}

struct LightOnCommand: ICommand {
    var light: Light!
    func execute() {
        light.on()
    }
    
    func undo() {
        light.off()
    }
}

/**
    Sender
 */
class Application {
    var openGarageCommand: ICommand
    var lightOnCommand: ICommand
    var history = Array<ICommand>()
    
    init () {
        let light = Light()
        let garageDoor = GarageDoor()
        self.openGarageCommand = GarageOpenDoorCommand(garageDoor: garageDoor)
        self.lightOnCommand = LightOnCommand(light: light)
    }
    
    func undoAll () {
        while history.count > 0 {
            if let last = history.popLast() {
                last.undo()
            }

        }
    }
    
    func onLight () {
        history.append(lightOnCommand)
        lightOnCommand.execute()
    }
    
    func upGarage () {
        history.append(openGarageCommand)
        openGarageCommand.execute()
    }
}

let app = Application()

app.onLight()
app.upGarage()
app.undoAll()
