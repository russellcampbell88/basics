//
//  Assignment 8.swift
//  
//
//  Created by Russell Campbell on 10/30/23.
//

import Foundation

//  Concurrent Queues are the only ones where you can mix sync/async
let concurrentQueue = DispatchQueue.( label: "ConcurrentQueue")
concurrentQueue.sync {
    for i in 0...1000{
        
    }
    print( "a. Task")
}
concurrentQueue.sync{
    for i in 0...50{

    }print("b. Task")
}
concurrentQueue.async{
    for i in 0...1{
        
    }print("c. Task")
}

//**Problem 2. Global Queues

//  Instead of main, use global. Global queues
//  are queues provides by the OS.
//  They're always concurrent queues.
DispatchQueue.global().async {
    print("Global Queue")
}

DispatchQueue.global(qos: .userInteractive).async {
    print("userInteractive") // global queues are good for animation work
}

//2.
DispatchQueue.global(qos: .userInitiated ).async{
    print(" This action is user initiated.") // any work user has started.
    //  The User requires immediate results - such as pull to refresh.
}

//3. Utility
DispatchQueue.global(qos .utility).async {
    print( "Utility" )
}

//4. Background
DispatchQueue.global( qos: .background ).async{
    print("background")
    // only specific when user is not aware
    // For tasks the user shouldn't be aware of at all.
}

//5. Unspecified
DispatchQueue.global( qos: .unspecified ).async{
    print("Unspecified")
    
}


// OperationQueue - queues that were built on top of the GCD
//  it gives more control to the user.
//  You can pause, resume, stop, and start tasks.
//  Add or define dependencies within your task.

let taskLettuce = BlockOperation {
    print("Adding lettuce to salad.")
}
