import UIKit

var greeting = "Hello, playground"

//  MARK: CONCURRENT QUEUES

//**Problem 1.

//  A concurrent queue allows us to execute multiple tasks at the same time.

//  Tasks will always start in the order they’re added but they can finish in a different order as they can be executed in parallel. 

//  Tasks will run on distinct threads that are managed by the dispatch queue. The number of tasks running at the same time is variable 
//  and depends on system conditions.

//  Concurrent Queues are the only ones where you can mix sync/async
let concurrentQueue = DispatchQueue( label:"ConcurrentQueue")

concurrentQueue.sync {
    for _ in 0...1000 {
        
    }
    print( "a. Task")
}
concurrentQueue.sync {
    for _ in 0...50 {

    };
    print("b. Task")
}
concurrentQueue.async {
    for _ in 0...1 {
        
    };
    print("c. Task")
}

//  MARK: GLOBAL QUEUES

//**Problem 2. Global Queues

//  Global concurrent queues schedule blocks as soon as
//  threads become available ("non-FIFO" completion order).

//  Instead of main, use global. Global queues
//  are queues provides by the OS.
//  They're always concurrent queues.

    //  1. Tasks in concurrent queue executes concurrently [background threads]
    //  2. Tasks are still started in the order that they were added to the queue
DispatchQueue.global().async {
    print("This is our Global Queue")
}

//  global(qos: )
//  Returns the global system queue with the specified quality-of-service class.

//  i. User Interactive
DispatchQueue.global(qos: .userInteractive).async {
    print("userInteractive") // global queues are good for animation work
}

//  ii. User Initiated
DispatchQueue.global(qos: .userInitiated ).async {
    print(" This action is user initiated.") // any work user has started.
    //  The User requires immediate results - such as pull to refresh.
}

//  iii. Utility
DispatchQueue.global(qos: .utility).async {
    print( "Utility" )
}

//  iv. Background
DispatchQueue.global( qos: .background ).async {
    print("background")
    // only specific when user is not aware
    // For tasks the user shouldn't be aware of at all.
}

//  v. Unspecified
DispatchQueue.global( qos: .unspecified ).async {
    print( "Unspecified" )
    
}

//  MARK: OPERATION QUEUE

//**Problem 3. Operation Queues

//  OperationQueue - queues that were built on top of the GCD
//  it gives more control to the user.
//  You can pause, resume, stop, and start tasks.
//  Add or define dependencies within your task.

let addCayenne = BlockOperation 
{
    print( "Adding cayenne to curry." )
}

let addTumeric = BlockOperation 
{
    print( "Adding tumeric to curry." )
}

let addCinnamon = BlockOperation 
{
    print( "Adding cinnamon to curry." )
}

let operationQueue = OperationQueue()

addTumeric.addDependency( addCinnamon )
addCayenne.addDependency( addTumeric )
operationQueue.addOperations( [addCayenne, addTumeric, addCinnamon ], waitUntilFinished: false )
    

operationQueue.maxConcurrentOperationCount = 1


//  MARK: Await Async -- Added in iOS 13 in 2019

//**Problem 3. Await Async

//  Async means asynchronous and can be seen as a method attribute making it clear that a method performs asynchronous work.
//
//  Await is the keyword to be used for calling async methods. The await keyword will always go with
//  asynchronous calls
func task1() async {
    print( "Task 1" )
    for _ in 0...1000345 {
        
    }
}

func task2() async {
    print( "Task 2" )
    for _ in 0...10003 {
        
    }
}

//  Await gives us Structured Concurrency; with async-await method calls makes it easier to reason the order of execution.
//Methods are linearly executed without going back and forth, like with closures.
Task {
    await task1( )
    await task2( )
}

//  MARK: ACTORS

//**Problem 4. Actors

/*
 *  Actors -- properties, functions, initializers
 *  (constructors), deinitializers.
 *
 *  Actors do not support iheritance.
 *  Actors guarantee properties will be modified one at a time.
 
 *   One of the core advantages of Swift’s actor types is that they can help prevent “data races” — that is, 
     memory corruption issues that can occur when two separate threads attempt to access or mutate the same data at the same time.
 *
 */
actor BankDetails {
    var balance: Double
    
    init( balance: Double ) {
        self.balance = balance
    }
    
    func deposit( amount: Double ) {
        balance += amount
        print( "Deposit amount = \(amount) balance is \(balance)" )
    }
    
    func withdrawAmount( amount: Double ) {
        balance -= amount
        print( "Withdraw Amount =\(amount) balance is \(balance)")
    }
}

let bankDetails = BankDetails( balance: 5000 )


//  Actors require the use of await
Task {
    await bankDetails.deposit( amount: 100 )
}

Task {
    await bankDetails.deposit( amount: 50  )
}

Task {
    await bankDetails.deposit( amount: 200 )
}

/*Actors work much like classes (that is, they are passed by reference), with two key exceptions:
* An actor automatically serializes all access to its properties and methods, which ensures that only one 
  caller can directly interact with the actor at any given time. That in turn gives us complete protection against data races, 
  since all mutations will be performed serially, one after the other.

* Actors don’t support subclassing since, well, they’re not actually classes.
*
* So, practically, all that we have to do to convert our UserStorage class into an actor is to go back to its original implementation,
  and simply replace its use of the class keyword with the new actor keyword:
 */
actor UserStorage {
    private var users: [String] = []

    func store() {
        for user in users {
            print( "All users:", user ) // string interpolation can only appear in literal
        }
    }


}
//  actor CurrentBankDetails: BankDetails{}
