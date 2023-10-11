
class SuperEnemy {
    let name: String
    var hitPoints: Int
    
    init(name: String, hitPoints: Int) {
        self.name = name
        self.hitPoints = hitPoints
    }
}


protocol Superhero {
    var name: String { get }
    var alias: String { get }
    var isEvil: Bool { get }
    var superPowers: [String: Int] { get }
    
    func attack(target: SuperEnemy) -> Int
    mutating func performSuperPower(target: SuperEnemy) -> Int
}


extension Superhero {
    func infoAboutHero() {
        print("hero's name is: \(name) alias: \(alias) hero is \(isEvil) superPowers: \(superPowers)")
    }
}


struct SpiderMan: Superhero {
    var name: String
    
    var alias: String
    
    var isEvil: Bool
    
    var superPowers: [String : Int]
    
    func attack(target: SuperEnemy) -> Int {
        let randomDamage = Int.random(in: 20..<40)
        target.hitPoints -= randomDamage
        
        return target.hitPoints
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        
        guard let randomSuperPower = superPowers.randomElement() else {
                return 0
            }
        
        superPowers.removeValue(forKey: randomSuperPower.key)
        
        target.hitPoints -= randomSuperPower.value
        
        return target.hitPoints
    }

    
    
}


struct Barnacleboy: Superhero {
    var name: String
    
    var alias: String
    
    var isEvil: Bool
    
    var superPowers: [String : Int]
    
    func attack(target: SuperEnemy) -> Int {
        let randomDamage = Int.random(in: 20..<40)
        target.hitPoints -= randomDamage
        
        return target.hitPoints
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        
        guard let randomSuperPower = superPowers.randomElement() else {
                return 0
            }
        
        superPowers.removeValue(forKey: randomSuperPower.key)
        
        target.hitPoints -= randomSuperPower.value
        
        return target.hitPoints
    }
    
}

struct Mermaidman: Superhero {
    var name: String
    
    var alias: String
    
    var isEvil: Bool
    
    var superPowers: [String : Int]
    
    func attack(target: SuperEnemy) -> Int {
        let randomDamage = Int.random(in: 20..<40)
        target.hitPoints -= randomDamage
        
        return target.hitPoints
    }
    
    mutating func performSuperPower(target: SuperEnemy) -> Int {
        
        guard let randomSuperPower = superPowers.randomElement() else {
                return 0
            }
        
        superPowers.removeValue(forKey: randomSuperPower.key)
        
        target.hitPoints -= randomSuperPower.value
        
        return target.hitPoints
    }
    
}


class SuperHeroSquad {
    
    var superheros : [Superhero]
    
    init(superheros: [Superhero]) {
        self.superheros = superheros
    }
    
    func superheroList() {
        for hero in superheros {
            print("name: \(hero.name) alias: \(hero.alias)")
        }
    }
    
}


//class AnySuperhero: Superhero {
//    
//    var superhero: Superhero
//    
//    var name: String {
//        return base.name
//    }
//    
//    var alias: String = ""
//    
//    var isEvil: Bool
//    
//    var superPowers: [String : Int] {
//        get {
//            return base.superPowers
//        }
//        set {
//            base.superPowers = newValue
//        }
//    }
//    
//    func attack(target: SuperEnemy) -> Int {
//        return base.attack(target: target)
//    }
//    
//    func performSuperPower(target: SuperEnemy) -> Int {
//        return base.performSuperPower(target: target)
//    }
//    
//    init(superhero: Superhero, alias: String, isEvil: Bool) {
//        self.superhero = superhero
//        self.alias = alias
//        self.isEvil = isEvil
//    }
//    
//}
//


func simulateShowdown(squad: SuperHeroSquad, enemy: SuperEnemy) {
    
    for var hero in squad.superheros {
        while enemy.hitPoints > 0 && !hero.superPowers.isEmpty {
            if !hero.superPowers.isEmpty {
                hero.performSuperPower(target: enemy)
                print("\(hero.alias) used superpower on \(enemy.name). hp left: \(enemy.hitPoints)")
            } else {
                hero.attack(target: enemy)
            }
            
            if enemy.hitPoints <= 0 {
                print("\(enemy.name) defeated!")
                break
            }
        }
    }
    if enemy.hitPoints > 0 {
        print("\(enemy.name) defeated the superheroes!")
    }
}


let spiderman = SpiderMan(name: "Peter Parker", alias: "Spider-Man", isEvil: false, superPowers: ["Web Breath": 20, "Thread Manipulation": 25])

let barnacleboy = Barnacleboy(name: "Tim", alias: "Barnacle Boy", isEvil: false, superPowers: ["Underwater cannon" : 25, "underwater ball": 15])

let mermaidman = Mermaidman(name: "Ernie", alias: "Mermaid Man", isEvil: false, superPowers: ["controlling sea creatures" : 10, "super strength punch": 30])

let manray = SuperEnemy(name: "Man Ray", hitPoints: 200)

let squad = SuperHeroSquad(superheros: [spiderman, barnacleboy, mermaidman])


simulateShowdown(squad: squad, enemy: manray)








