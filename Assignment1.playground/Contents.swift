import UIKit

var greeting = "Hello, playground"

/************** ASSIGNMENT 1 ******************/

//** Problem 1. Constants

//  This expression creates a const, which stores a constant.
//  For demonstation, I use my name.
//  My name will not change, so it is a constant.
let name = "Russell"
 
//** Problem 2. Variables

//  This creates a variable. For demonstation, I use my age
var age = 30
var occupation:String = "iOS Developer"

//** Problem 3. Functions!
//
//  Functions, or methods/behaviors, represent actions that an object takes.
//  Functions take in data, manipulate it in the form of a behavior, and (can) return a
//  result.
func displayAge(age: Int) -> Int {
    let age = 30
    print(age)
    return age;
}

//** Problem 4. Type Inference
//    Type Inference is a feature of Swift, in which the IDE will infer the datatype
//    after the assignment operator
//
//  Swift will infer the type of a varible without you specifying that in the IDE
var EmployeeID = 114    // infers that EmployeeID is an integer


//** Problem 5. Type Safety
//
//  In Swift, Type Safety prevents you from adding variables of conflicting
//  datatypes that would result in illegal combinations of data
//
//  e.g., you cannot do
//

//  var age = 30 + "battle_mech"


//** Problem 6. Arrays
//
// An array is a collection of similar datatypes, with a starting index of 0
var arrayOfInts = [1,2,3,4,5,6]

//  You can access elements of an array with arrayName[indexNumber]
print(arrayOfInts[0])
print(arrayOfInts[1])
print(arrayOfInts[2])
print(arrayOfInts[3])
print(arrayOfInts[4])
print(arrayOfInts[5])
print(arrayOfInts[6])


//** Problem 7. Tuples
//
//  A Tuple is a data structure that allows multiple unique datatypes to be returned.
//  Demonstrated with our Tuple TupleExample
//
//  Returning Multiple Results in Tuples
let tupleExample = (1, "A", true)
let tupleExample2 = (2,"B",true)

print(tupleExample.0)
print(tupleExample.1)
print(tupleExample.2)

func methodReturningMultipleValues() -> (Int, String){
    return (10,"ABC");
}

//** Problem 8. Theoretic Q&A

// Ready for anything!

