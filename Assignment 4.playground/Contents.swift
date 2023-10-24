import UIKit

var greeting = "Hello, playground"
print( greeting )

//  Assignment 4

//  1. Protocol Usage
//  2. Property Usage/types of properties
//  3. Extension Use
//  4. Generics - basic use.


//  Protocols - Interface
/*
    Protocol - the list of rules or blueprint which a class or struct (or anyone who adopts/confirms it, needs to give an implementation for a function/variables.
        
        Think of it like an interface from other languages.
        Typically in the form with a suffix of -able.
 
        Any class, struct, or enum that implements an interface
        needs to provide its own methods specified by the interface.
 
        Protocols are only blueprints. They don't have their own memory.
 
        As with interfaces, Think about it--how do you INTERFACE with a piece of candy?
        You CONSUME it. It is Consumable.
 
        Think about it--how do you INTERFACE with a Car? 
        You DRIVE it. It is Drivable.
 
        So we know the English word "Protocol" means "set of rules" or "accepted standards"
        Therefore Protocol is a list of rules you need to INTERFACE with this class/struct/object.
 
        Lastly, think of a Protocol as a blueprint.
 */

// Problem #1. Protocols
protocol Consumable
{
    //  Properties of protocol
    var calories: Int { get set } // if you have a getter/setter, you don't need mutating
    
    //  Functions/methods/behaviors of protocol
    func unpackage( )
    func eat()
    func discard( location: String )
}

//  Anything that adopts or implements the protocol needs to have the
//  fleshed-out implementation of the methods.
struct Candy: Consumable
{
    //  Behaviors
    func unpackage() {
        print( "Unwrapping sweet." )
    }
    
    func eat() {
        print( "Consuming confectionery." )
    }
    
    func discard(location: String) {
        print( "Disposing of candy in \(location)" )
    }
    
    //  Attributes
    var calories: Int
}


//******* IN-CLASS EXAMPLE *******//
protocol Drivable
{
    
    //  Properties of protocol
    var numberOfGears: Int { get set } // if you have a getter/setter, you don't need mutating
    
    //  Functions/methods/behaviors of protocol
    func accelerate( speed: Int )
    func applyBreaks()
    func steer( direction: String )
}



struct Car: Drivable
{
    func accelerate( speed: Int ) {
        print( "Accelerating truck by \(speed)" );
    }
    
    func applyBreaks( ) {
        print( "Applying breaks." );
    }
    
    func steer( direction: String ) {
        print( "steering the Car in \(direction)" );
    }
    
    var numberOfGears: Int
}
let car1 = Car( numberOfGears: 5 );

car1.accelerate( speed: 10 );
car1.steer( direction: "Turning left." );
car1.applyBreaks( );


struct Truck: Drivable
{
    func accelerate( speed: Int ) {
        print( "Accelerating truck by \(speed)" );
    }
    
    func applyBreaks( ) {
        print( "Applying breaks." );
    }
    
    func steer( direction: String ) {
        print( "steeing the Truck in \(direction)" );
    }
    
    var numberOfGears: Int
}
let truck1 = Truck( numberOfGears: 5 );

truck1.steer( direction: "Migi, where 'migi' means right." );
truck1.applyBreaks();
truck1.accelerate( speed: 100 );


//  The same as above, but for Electric Car
struct ElectricCar: Drivable
{
    
    func accelerate( speed: Int ) {
        print( "Accelerating electric car by \(speed)" );
    }
    
    func applyBreaks( ) {
        print( "Applying breaks." );
    }
    
    //  **NOTE: We want to know how to make an optional function
    func steer( direction: String ) {
        print( "steeing the electric car in \(direction)" );
    }
    
    var numberOfGears: Int
}
let electricCar = ElectricCar( numberOfGears: 5 );
electricCar.steer( direction: "Lefto desu uwu." );



//  Protocols and enumz!
enum DriveDirection: Drivable {
    
    //  You can also define an enum in a single line of code.
    case left, right, up, down
    
    func accelerate( speed: Int ) {
        print( "Accelerating electric car by \(speed)" );
    }
    
    func applyBreaks( ) {
        print( "Applying breaks." );
    }
    
    func steer( direction: String ) {
        print( "steering the drive direction in \(direction)" );
    }
    

}

let direction1 = DriveDirection.left
print( direction1 )


//  QUESTION: How do we make a function an optional?
//  ANSWER: We create an extension and create an implementation.

//** Problem #2. Property Types in iOS
/*
 *
 *  A Property Type in iOS is a type inherent to a data type in a class.
 *
 ****/

class Circle
{
    init ( radius: Double )
    {
        self.radius = radius
    }
    
    // Stored Property: saving some data to a variable
    var radius: Double = 100 // stored Properties

    var area: Double
    {
        // Computed Property: Performing some operation on a variable.
        return Double.pi * radius * radius
        //  Doing calculation/computation and returning a value
    }   //  example: a game value that needs to be rendered every frame

    //  Lazy variable--if you change the varible, [. . .]
    lazy var circumference: Double = {
        
        print( "This is a lazy property." );
        return ( 2 * Double.pi * radius ) // 2 * pi * r
        
    }()
    
    // *NOTE: lazy properties only get computed once.
    // *NOTE: lazy vars optimize memory and CPU.
    
        //  need the equal after the double and the () after as part of its
        //  syntax.

}


//  Problem #3. Extensions
/*
 *  
 *  In Swift, extensions let us add functionality to any type.
 *  It extends the functionality of a class or a protocol.
 *  In other words, extensions let us add meaning to a protocol/
 *
 */

//  In Bhushan's example, we're adding an extension to Integer that enables squaring a number.
extension Int {
    func square() -> Int
    {
        return self * self
    }
    
    var isNumberEven: Bool {
        return self % 2 == 0
    }
 
}

//  Square 15 to get 225.
let integer1 = 15
let result = integer1.square()

25.square()

//  What's the reasoning for using Extensions? 
//  Well, for one, they're a good way to visually
//  separate your code into logical groupings.


class Temperature
{
    var celcius: Double = 0
    
    func setTemperature( givenTemp: Double ) {
        celcius = givenTemp;
    }
}

let celciusModifier = 1.8
let celciusBoost = 31.0


let temperature1 = Temperature()
temperature1.setTemperature( givenTemp: 40 )

//  In Bhushan's Temperature example, we're simply adding convertToFarenheit()
//  functionality to the Temperature class.
extension Temperature
{
    func convertToFarenheit() {
        var farenheit = ( celcius * celciusModifier ) + celciusBoost
        print( "farenheit = \(farenheit)")
    }
}


//  Problem #4. - Generics and Their Basic Usage
func doSumOfTwoNums( number1: Int, number2: Int ) {
    let result = number1 + number2
    print( "result = \( result )" )
}
doSumOfTwoNums( number1: 2, number2: 3 )

//  The purpose of a Generic is to work with any Datatype.
//  We use Numberic on the Parameterized/Generic function to enable
//  the arthmetic operations on number1 anf number2.
func genericSumOfTwoNumbers< T: Numeric >( number1: T, number2: T )
{
    let result = number1 + number2
    print( "Generic result = \( result )" )
}

genericSumOfTwoNumbers( number1: 10, number2: 20 )
genericSumOfTwoNumbers( number1: 100.1, number2: 50.2 )
