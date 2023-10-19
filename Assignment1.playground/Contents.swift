import UIKit

var greeting = "Hello, playground"

/************** ASSIGNMENT 1 ******************/

//  Problem 1. Constants
//  This expression creates a const, which stores a constant.
//  For demonstation, I use my name.
let name = "Russell"
 
//  Problem 2. Variables
//  This creates a variable. For demonstation, I use
var age = 30

//  Problem 3.
func displayAge(age: Int) -> Int {
    let age = 30
    print(age)
    return age;
}

// Problem 4.

// Swift will infer the type of a varible without you specifying that in the IDE
var EmployeeID = 114    // infers that EmployeeID is an integer

// Problem 5.


// Problem 6.


// Problem 7.


// Problem 8.
//  A Tuple is a data structure that allows multiple unique datatypes to be returned.
//  Demonstrated with our Tuple TupleExample
//
//  Resturning Multiple Results in Tuples
let tupleExample = (1, "A", true)
let tupleExample2 = (2,"B",true)

print(tupleExample.0)
print(tupleExample.1)
print(tupleExample.2)

func methodReturningMultipleValues() -> (Int, String){
    return (10,"ABC");
}

// Problem 9.

