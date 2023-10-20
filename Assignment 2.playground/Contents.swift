import UIKit

var greeting = "Hello, playground"

//Assignment-2 for today
/*
Create new playground taking any Example of your choice, so as to display the use of
Below in Swift
1.Sets
2.Dictionary
3.Optionals
4.Show different ways of optional binding
5.Classes and inheritance and initialisers for it
7.Structs and initialisers for it 
 */

/************** ASSIGNMENT 2 ******************/

//** Problem 1. Sets
/*  
    Sets are unordered collection of unique elements.
    Sets are unique in that they don't contain duplicate
    elements
*/
 var evangelionCollection:Set<String> = ["Unit00","Unit01","Unit02"]

//  Add elements to a Set
evangelionCollection.insert("Unit 05")

// Sets need to be explicitly defined
var numbers:Set = [ 1, 2, 3, 4 ]


//** Problem 2. Dictionary(ies)
/*  
    A Dictionary is another collection in Swift that provides a
    Key-Value Pair.
*/

//  Initialize a Dictionary
var fantasyNovels: [ String: Int ] = [ "A Song of Ice and Fire":5 ]

//  Print a Dictionary
print( fantasyNovels )

//  Insert an element into a Dictionary
fantasyNovels[ "The Winds of Winter" ] = 6
fantasyNovels[ "A Dream of Spring" ] = 7

//  Removal from a Dictionary
fantasyNovels[ "A Dream of Spring" ] = nil

//** Problem 3. Optionals
/*  
    An Optional is a variable type where there can or can't be
    a value for the optional variable(s). We can assign nil as
    a default value with an Optional. If a variable isn't an
    Optional, it must have an assigned value or we will get an
    error.
 
    We denote an Optional with a '?' following the variable
    name.
*/

//  If we don't immediately assign a value, it will be nil
//  by default.
var employeeID: Int?

//  Then we can assign a value later so the Optional isn't nil.
employeeID = 114


//  Alternatively we can assign a value to an Optional right away.
var pokemonName: String? = "Miraidon"


//** Problem 4. Optional Binding(s)
/*
    Optional Binding is where we 'unwrap' an optional to get
    its value. We do this to prevent the Optional from giving us
    nil, which could crash our app.
 
    There are 4 ways of Optional Binding:
 
    1) if let
    2) guard let
    3) Coalescing Operator (??)
    4) Force Unwrap (!)
*/

//  [ if let ] will give us the Optional's assigned value safely
//  'Let' is like defining a new varisble.
if let pokemon = pokemonName
{
    print( "The unwrapped value is", pokemon )
}

//  [ guard let ] is nearly identical to if let.
//  The main difference with if let is you can only
//  access the Optional value within the if block.
func checkGuardLet() // we wrap the guard let in a method
{
    guard let pokemon = pokemonName else {
        return
    }
    print( pokemon )
}

checkGuardLet()

//  The Nil-Coalescing Operator (??) allows us to print the value in one line.
//  If there's a value, print it straightfowardly.
//  It's useful when we simply want to print our value.
print( pokemonName ?? "Default value" )

//  The Force Unwrap (!) Operator performs a force unwrap of
//  the Optional. 
//
//  We generally don't use this to bind Optionals
//  due to the high probability of crashing our app if
//  the Optional is nil.
print( pokemonName! )


//** Problem 5. Classes, Inheritance, and Class Initialization
/*    
/     Classes in Swift are objects with Attributes/Behaviors.
/     The follow all Object-Oriented Programming principles (APIE).
/     They need intializers, and are capitalized.
*/

class Employee {
    
    //  Attributes/Variables
    var name: String
    var employeeID: Int

    //  Initializer (also Class Constructor)
    init(name: String, employeeID: Int) {
        self.name = name
        self.employeeID = employeeID
    }
    
    //  Behaviors/Methods/Functions
    func walking() -> Void {
        print("\(name) is walking")
    }
}

//  Call a class
let employee = Employee( name: "Russell", employeeID: 114 )

//  You can create a child class that inherits from teh parent
class Consultant: Employee {
    var developerType: String
    
    //  Constructor.
    //  Make sure the attributes from the Superclass/Parent signature are present
    init( name: String, employeeID: Int, developerType: String ) {
        self.developerType = developerType
        super.init(name: name , employeeID: employeeID)
    }
    
    //  Getters
    func getDeveloperType() ->String{
        return self.developerType
    }

    
    // Child Behaviors
    func develop() {
        print("We coded in Swift.")
    }
}

//** Problem 6. Structs and Struct Initializers
/*  
/  
/  Structs are data structures in Swift stored in stack memory.
/  Structs don't need initializers, while Classes do.
/  Structs do not support inheritance.
/
*/
struct Evangelion {
    
    var unit: String
    var pilot: String

}

//  We call Structs with the following syntax:
var unit00 = Evangelion( unit: "00", pilot: "Rei Ayanami" )
var unit01 = Evangelion( unit: "01", pilot: "Shinji Ikari" )
var unit02 = Evangelion( unit: "02", pilot: "Asuka Langley Sohryu" )
