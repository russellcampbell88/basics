import UIKit

var greeting = "Hello, playground"

//  Assignment-5
/* Create new playground taking any Example of your choice, so as to display the use of
Below in Swift
1.Generics for classes, enum, struct
2.Higher order functions
3.Closures AND its types
Prepare Theoretical part for above topics as well, We will have question answer session for it.
*/
                    
//**Problem 1. - Generics for Classes and Structs

//  Generics for Classes
//  by adding T, we make the class usable with any datatpe.
class GenericInformation< T > {
    //  When specifying the datatype to T, we generalize the var to handle any
    //  kind of data.
    var data: T
    
    init( data: T ) {
        self.data = data
    }
    
    func displayTheData() {
        print( "Data is = \(self.data)." )
    }
}

//  Generics for Structs

//  Here we have the Queue Data Structure, but in its
//  Generic form.

//  Remember, Queue is FIFO
struct GenericQueue< T > {
    
    var myqueue: [T]
    
    mutating func enqueue( element: T ) {
        myqueue.append( element )
    }
    
    mutating func dequeue() {
        myqueue.removeFirst()
    }
}


//** Problem 2. Higher Order functions

let numbers = [ 1, 2, 3, 4, 5, 6, 7 ]

var result0 = [Int] ()
for num in numbers {
    result0.append( num * num )
}
print( result0 )

// We use a map here
let squares = numbers.map{ $0 * $0 }
print( result )


//  MARK: FILTER
let evenNumber = numbers.filter{ $0 % 2 != 0 }
print("evenNumber- \(evenNumber)")

//  MARK: Reduce
//  Reduce temporarily stores a value.
let totalOfAllNumbers = numbers.reduce(0, +)
print("totalOfAllNumbers is- \(totalOfAllNumbers)")

//  MARK: Sort
let unsortedNumbers = [987, 33, 5, 76, 97, 3, 1, 199873, 4522]
let sortedValues = unsortedNumbers.sorted()
print( sortedValues )

//  MARK: FlatMap
//  Separates each element into a separate array. Flattens the array
let someWords = [ "Hello", "World","Swift" ]
let resul = someWords.flatMap{$0}

let duplicateNilArray = [ [123, 555], nil, [0, 0, 1, 4], [6, 555 ] ]
print( duplicateNilArray )



//**Problem 3. Closures --
/*
 * A closure is an unnamed block of code that we can pass around and use in code and can assign to a var or can return from a function size. You can pass closures as function arguments. They are essentially unnamed functions.
 * Closures are self-contained blocks of functionality that can be passed around in other
 * parts of the code.
 *
 */

//  Closures are reference types.
//  They capture and store the reference to any constants in the surrounding context.
//  Basically, they're functions that have environments of their own.

// i. Non-Escaping Closures
func squareThisNumber( number1: Int ) -> Int {
    return number1 * number1
}

let result = squareThisNumber( number1: 3 )
print( result )

let sayHi = {
    print("Hello Swift")
}
sayHi()

func doSquare( number1: Int, completion:(Int)->()){
        let result = number1 * number1
    completion( result )
}
doSquare( number1: 5, completion: { output in
    print("doSquare- \(output)")
})
        
    // ii. Escaping Closures
    func performAPICall( completion: () -> () ) {
        print( "flag that we're in performAPICall")
        
        DispatchQueue.global().async {
            print("2. We are inside global Queue" )
            
            Thread.sleep( forTimeInterval: 4 )
            
            DispatchQueue.main.async {
                print( "3. We are inside DispatchQueue.main" )
                print( "4. After a 4-second delay" )
            }
            print( "5. After DispatchQueue main" )
        }
    }
        performAPICall {
            print( "Once we get a response from performAPICall." )
        }
          
    // iii. Trailing Closure
    /*
     *   Trailing Closures occur whenever there is a closure which is
     *   a last parameter for a function then it will be called a trailing closure
     */
    func doThisTask ( name: String, age: Int, onSuccess: (String) -> Void )
    {
        let bioData = "Name of Person is \(name) and age is = \(age)"
        onSuccess( bioData )
    }
    
    doThisTask( name: "Russell", age: 30 ) { result in
        print( result )
    }
    
    // iv. Auto Closures
    /* When a closure doesn't take any parameter;
     * it enables you to define an argument that
     * automatically gets wrapped in a closure.
     * It's used inside Swift wherever code needs to be passed in
     * and executed only if conditions are right     */
    
    //  It returns anything from a closure, then it gets self-wrapped when when called, this ins known as an Auto Closure. It doesn't accept, doesn't return
    func travelToDestination( action:()->() ) {
        action()
    }
