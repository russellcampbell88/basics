import UIKit

var greeting = "Hello, playground"

//  MARK: CONCURRENT QUEUES
//  Concurrent Queues are the only ones where you can mix sync/async
let concurrentQueue = DispatchQueue( label:"ConcurrentQueue")

concurrentQueue.sync {
    for _ in 0...1000{
        
    }
    print( "a. Task")
}
concurrentQueue.sync {
    for _ in 0...50{

    };
    print("b. Task")
}
concurrentQueue.async {
    for _ in 0...1{
        
    };
    print("c. Task")
}

//**Problem 2. Global Queues

//  Instead of main, use global. Global queues
//  are queues provides by the OS.
//  They're always concurrent queues.
DispatchQueue.global().async {
    print("Global Queue")
}


//  i. User Interactive
DispatchQueue.global(qos: .userInteractive).async {
    print("userInteractive") // global queues are good for animation work
}

//  ii. User Initiated
DispatchQueue.global(qos: .userInitiated ).async{
    print(" This action is user initiated.") // any work user has started.
    //  The User requires immediate results - such as pull to refresh.
}

//  iii. Utility
DispatchQueue.global(qos: .utility).async {
    print( "Utility" )
}

//  iv. Background
DispatchQueue.global( qos: .background ).async{
    print("background")
    // only specific when user is not aware
    // For tasks the user shouldn't be aware of at all.
}

//  v. Unspecified
DispatchQueue.global( qos: .unspecified ).async{
    print("Unspecified")
    
}

//  MARK:
//  OperationQueue - queues that were built on top of the GCD
//  it gives more control to the user.
//  You can pause, resume, stop, and start tasks.
//  Add or define dependencies within your task.

let taskLettuce = BlockOperation {
    print( "Adding lettuce to salad." )
}

let taskTomato = BlockOperation {
    print( "Adding Tomato to Salad." )
}

let taskOnion = BlockOperation {
    print( "Adding Onion to Salad" )
}

let operationQueue = OperationQueue()

taskTomato.addDependency( taskOnion )
taskLettuce.addDependency( taskTomato )
operationQueue.addOperations([taskLettuce, taskTomato, taskOnion], waitUntilFinished: false)
    

operationQueue.maxConcurrentOperationCount = 1

// MARK: Await Async -- added in iOS 13 in 2019
func task1() async {
    print("Task 1")
    for _ in 0...1000345 {
        
    }
}

func task2() async {
    print( "Task 2" )
    for _ in 0...10003 {
        
    }
}

Task {
    await task1( )
    await task2( )
}

//  MARK: Actors

/*
 * Actors [include] properties, functions, initializers
 *  (constructors), deinitializers.
 *
 *  Actors do not support iheritance.
 *  Actors guarantee properties will be modified one at a time.
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


let bankDetails = BankDetails( balance: 500 )

Task {
    await bankDetails.deposit( amount: 100 )
    await bankDetails.deposit( amount: 50  )
    await bankDetails.deposit( amount: 200 )
}
//  actor CurrentBankDetails: BankDetails{}
