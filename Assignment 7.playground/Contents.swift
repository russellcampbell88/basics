import UIKit

var greeting = "Hello, playground"

//  To test out
print( greeting )

//************ ASSIGNMENT 7 - MEMORY MANAGEMENT *************//

//  MARK: AUTOMATIC REFERENCE COUNTING

/*
 Memory management in Swift is handled by
 ARC - Automatic Reference Counting (Swift's Garbage Collector)
 
 The ARC works in both ObjC and Swift. It stores referenced to
 objects and frees these references when they're no longer needed.
 
 
 The hallmark of a professional developer is how well they manage
 memory in their code.
 
 */

class Person {
    
    var name: String // variables decalred are strong variables by
                     // default
    var age: Int?    // optionals are "weak" references
    
    //  The 'weak' keyword doesn't increase the reference count
    //  for the variable it's called for
    //
    //  You DON'T need to worry about reference counting in enums
    //  or structs.
    weak var car: Car?

    init( name: String, age: Int )
    {
        self.name = name
        self.age = age
        print( "init" )
    }
    
    //  If you don't free the memory, you deinit won't get called,
    //  and you run the risk of a memory leak.
    deinit 
    {
        self.age = nil
        print( "deinit" )
    }
}

var person: Person? = Person( name: "Russell", age: 30 )
person = nil

var person2 = person
person2 = nil



//**Problem 2. MARK: STONG, WEAK, AND UNOWNED REFERENCES

 
/*
 * 1. Strong - this is the default. we use strong references to keep objects
     alive as long as they're being used.
 * 2. Weak - when you don't want to have ownership of the object.
      Breaks the cycle. As well, weak does not increase the reference count.
     unowned - similart to weak, but an unknown variable should always have data, otherwise thge data will crash.
 */


//  This is how OS tracks which object should be kept in memory or not.
//  You can't create a strong reference that's not optiona'
//  As long as the [reference] is there, we know the [object] is ther
//  The more strong references you make
class Car 
{
    var type: String = ""
    var owner: Person?
    
    init( type: String, owner: Person ) 
    {
        self.type = type
        self.owner = owner
    }
    
    deinit 
    {
        print("Deinitializing Car")
    }
}


//  Additionally, weak variables  help us understands 
//  which classes will live longer than pther classes.


//  MARK: RETAIN CYCLE
/*
 * 1. Retain Cycle Issue - when 2 strong Objs retain each other
 *    strongly, then it creates a cyclic loop of dependency, which
      gets called as a Retain Cycle Issue
 */


//  Also, 'weak' tells variables \, 'don't do reference counting.'
var car1: Car? = Car( type: "Electric"  )
var person1: Person? = Person( name: "Russell", age: 30 )
person?.car = car1

//  The constructors of the Car class are called
car1?.owner = person

//  Make sure you clear out memory when you're done with it,
//  even if you're using a strong reference.
person1 = nil

//  Freeing is Another way of telling the compiler, "I'm done"
car1 = nil


//  Whenever you creat ean object from any variable,
//  There is a _ for any variable

//  This frees the memory, and is equivalent to
    // a free statement in another programming language.

//  Reference count = 0 before initialization
//  Reference count = 1 after initialization
//  Reference count = 0 after making it nil

//  Optionals have NO BEARING on the Reference Count!

//  Person = nil // This decrements the reference count by 1

//  setting to nil prevents an unnecessary memory leak
//  Tells compiler to clear the memory.
//  The ARC then comes along and clears the reference

//  MARK: CONCURRENCY/MULTITHREADING
/*
 *  Concurrency/Multithreading
 *  1. GCD: G-rand C-entral D-ispatch
 *  2. Operations and Operation Queues
 *  3. SwiftConcurrency - Await Async
 *  4. Actor
 *  5. ThirdParty Frameworks - Combine, RXSwift, PromiseKit
 *  6. Thread ___
 */


// MARK: GRAND CENTRAL DISPATCH
/*
 *  1. GCD: G-rand C-entral D-ispatch
    Queue-Base API that will allow us to execute tasks in FIFO order
        3 Types of Queue: Main, Serial, and Global.
 *          
 
 * Main Queue: It's the main thread. Anything
 *              relating to the UI should be done on the main thread.
 */


//  Main Queue - Main Thread
DispatchQueue.main.async {
    
    print("Main Thread A Started")
    var a = 1
    for i in 0...10000{
        a += 1
    }
    print("Main Thread A Ended")
}

DispatchQueue.main.async{
    print("Main Thread B Started")
    var a = 1
    for i in 0...1000{
        a += 1
    }
    print("Main Thread B Ended")
}

/*
*
*  // MARK: Serial Queue
*
*/
let serialQueue1 = DispatchQueue(label: "Q1")
let serialQueue2 = DispatchQueue(label: "Q2")

serialQueue1.async {
    print("Serial queue 1") //runs first
}

serialQueue1.async {
    print("Serial que 2") //runs second
}

/*
 *
 * Concurrent Queue
 *
 */

let concurrentQuenue = DispatchQueue(label: "concurrentQuenue", attributes: .concurrent)
concurrentQuenue.async {
    for _ in 1...10000{//to delay the concurrent Quenue
    }
    print("Ca task")
}
concurrentQuenue.async {
    print("Cb task")
}

// "Awaiting Code Review"
