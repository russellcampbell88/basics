import UIKit

var greeting = "Hello, playground"

//Assignment-3
/* Create new playground taking any Example of your choice, so as to display the use of
 
Below in Swift
 
1. Control Statements (if, if else, if else-if else, switch)
 
2. Loops (for loop, while loop, repeat-while)

3. Initialisers in Swift

4. Enums and its types

5. Different uses of Enums and use of variables and functions inside Enum

6. Mutating Function in struct

7. Create a word document or notes with theoretical concepts for our topics discussed till today. Keep this with you, at end of training it will useful to revise topics before interview.

 Prepare Theoretical part for above topics as well, We will have question answer session for it.
                                                                    
*/

/*********** ASSIGNMENT #3 *********/

//** Problem 1. Control Statements/Conditionals

//  The if statement executes a block of code if the conditional
//  evaluates to True.

var isCorrect = true

if isCorrect
{
    print( "This is a corrent statement." )
}

//  Conditional logic with numerical statements
var num = 11

if num > 10
{
    print("This is a correct statement.")
}

//  CASE II: if-else statement
if isCorrect
{
    print("This is a correct statement.")
} 
else
{
    print("This is a false statement.")
}

//  CASE III: if-else-if statement
if num > 5 
{
    print("This is a correct statement.")
}
else if num < 12
{
    print("This is a false statement.")
} 
else 
{
    print( "This number doesn't match any requirements" )
}

//** Switch Statements **//

/*
 *  The switch statement is a statment we can use in lieu of a
 *  series of if else-if statements.
 */

//
//
func getVehiclePrices( range: VehiclePrices ) 
{
    switch range 
    {
        case .highEnd( price: let price ):
            
            if ( price > 1000 )
            {
                    print("This is a costly vehicle")
            }
        
        case .lowEnd( price: let price):
        
            if ( price < 500 )
            {
                print("This is a cheap vehicle")
            }
        
        default: // if no cases match, switch statements will always
                 // go to default
            print("default")
    }
}


//** Problem 2. Loops

/*
    The FOR Loop.
    A FOR Loop uses an iterator and an incrementor to travel though
    A given collection of data, typically (but not always) an array.
*/

//  Let's define our numbers array for the example.
let numbersArray = [1, 2, 3, 4, 5, 6, 7]

//  For every value in the numbersArray, print the value to the console.
for value in numbersArray 
{
    print( value )
}

for ( index, element ) in numbersArray.enumerated() {
    print("index- \(index), value= \(element)")
}

//  FOR Loop to iterate through a dictionary
let dictionary = [ "a": 1, "b": 2, "c": 3 ]

for value in dictionary {
    print( value )
}

//  Now we pront each Key-Value pair seperately.
for( key, val ) in dictionary
{
    print("key= \(key), value= \(val)")
}

//  for i in 2...10 
//  {
//      print(i)
//  }

/*
 *  We can use stride to skip elements in a for loop.
 */
for i in stride( from: 1, to: 20, by: 2 )
{
    print( i )
}


//*** While Loops ***//
/*
 *  The While loop executes so long as a certain condition is true.
 */

//  Vanilla while loops

var numSecond = 15

while numSecond > 10 
{
    print( num )
    numSecond += 1
}

//***  Do-While Loops ***//

/*
 * In Swift, the repeat-while loop is the equivalent of the do-while 
 * loop from other languages.
 *
 */
repeat
{
    print( num )
    num += 1
}   while num <= 20

            
//** Problem 3. Initializers
/*
 *
 *  In Swift, Initializers are a required component of class declaration.
 *
 */

//  Initialization of Classes
//  ** Remember, classes are reference type in Swift
            
class Person {
    var name: String = "SwiftUI"
    var age: Int = 4
}

let p1 = Person()

//  Initialization of Struct
struct EmployeeStruct 
{
    var employeeName: String
    var employeeAge: Int
}
let e1 = EmployeeStruct( employeeName: "SwiftUI", employeeAge: 3 )


//  Failable Initializer
struct Dog{
    var breed:String
    
    //  Dog constructor
    init ? ( breed: String ) 
    {
        if breed != "xyz" 
        {
            return nil
        }
        self.breed = breed
    } //    We can only create dog iff a certain condition exists
    
}

let dog1 = Dog( breed: "St. Bernard" )


//  Required Initializer
class EmployeeClass {
    var yearsOfExperience: Int
    
    required init(yearsOfExperience: Int) {
        self.yearsOfExperience = yearsOfExperience
    }
}

class AccountEmployee: EmployeeClass {
    var age: Int
    var yearsOfExp: Int
    
    init( age: Int, yearsOfExp: Int ) {
        self.age = age
        
        super.init( yearsOfExperience: yearsOfExperience )
    }
    
    required init( age: Int, yearsOfExperience: Int )
    {
        fatalError( "The required initialization is missing")
    }
    
    required init( yearsOfExperience: Int) {
        fatalError( "Init( yearsOfExperience: ) has not been implemented" )
    }
    
}

//  Problem 4. Enums
enum Days:Int 
{
    case day1   = 100
    case day2   = 200
    case day3   = 300
    case day100 = 1000
}
/*
 *  The same as with structs, Enums are also value types.
 *  Have properties/variable and behaviors/functions
 *  Their use is related to that of error handling.
 */

enum WeekendDays: String 
{
    case sunday   = "The Final Day of the Weekend"
    case saturday = "The first day of the Weekend"
}

print( WeekendDays.saturday.rawValue )

//  Problem 5. Enums (and their various uses)
enum WeekDays: CaseIterable 
{
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    func dayType() -> String
    {
        return self {
            case .sat:
                return "Weekend"
            case .sun:
                return "Weekend"
            default:
                return "Weekdays"
        }
    }
    
    var numberOfDays: Int 
    {
        return 7
    }
}

//  Associated Type Enum
enum VehiclePrices
{
    case highEnd( price: Int )
    case lowEnd ( price: Int )
    case midEnd ( price: Int )
}

print( VehiclePrices.highEnd( price: 100 ) )

getVehiclePrices( range: ( VehiclePrices.highEnd( price: 1200 ) ) )
getVehiclePrices( range: ( VehiclePrices.lowEnd( price: 200 ) ) )
//  Real use of enums is use with switch cases
//  where you pass the enum into the switch

//** Problem 6. The Mutating Function in a Struct

//  Definition:
//  Though Structs in Swift are immutable, the mutating keyword in Swift can allow us to change
//  The properties of a Stuct. Technically, you're creating and returning a new Struct.
//  The mutating keyword is used if you're changing a property within a struct.
//  The mutating keyword alerts us that a method is going to make a value change within the struct.

struct Evangelion {
    var pilot: String

    mutating func changePilotName( pilotName: String )
    {
        pilot = pilotName
    }
}

var evaPilot = Evangelion(pilot: "Shinji Ikari")
print( evaPilot.pilot )

evaPilot.changePilotName( pilotName: "Asuka Langley Sohryu" )
print( evaPilot.pilot )

evaPilot.changePilotName( pilotName: "Rei Ayanami" )
print( evaPilot.pilot )

evaPilot.changePilotName( pilotName: "Mari Illustrious Makinami" )
print( evaPilot.pilot )
