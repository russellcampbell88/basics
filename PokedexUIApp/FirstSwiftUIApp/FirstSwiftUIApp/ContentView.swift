//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/6/23.
//

import SwiftUI

/*
*
*  Property Wrappers in SwiftUI
*  they add extra meaning to variables
*
* 1. State: State PWs are any PWs with simple datatypes: String, Int, Double, Bool
* 2. Binding: PWs used when you want to share data between 2 screens. Modification on the first
              screen shows up on the second screen
 
* 3. StateObject        -
* 4. ObservedObject     -
* 5. ObservableObject   -
* 6. Environment        - Uses variables from the

    Operating
     System
 
* 7. EnvironmentObject  - Used for passing objects one-by-one
* 8. AppStorage         -
* 9. Fetch              -
*/



// Published Property
struct ContentView: View
{
    
    // ~Remember: Structs are immutable by default
    //  @State Property Wrappers
    @State var emailID: String = ""
    @State var password: String = ""
    @State var screenTitle: String = "Welcome to SwiftUI"
    
    @State var isDisplayed: Bool = false
    //  Binding Property Wrappers
    
    
    var body: some View
    {
        //  Wrap NavigationStack around our ContentView
        //  to essentially serve the same function as
        //  Navigation View Controller.
        //  Stack because we're dealing with structs.
        NavigationStack // iOS 16+
        {
            ZStack
            {
                Image("Dex").resizable()
                
                //  Align one on top of another
                VStack ( spacing: 20 )
                {
                    
                    /*Text("Welcome to PokemonUI")
                     .font( .title )
                     .foregroundStyle( .red )
                     .frame(maxWidth: .infinity )
                     .padding( 10 ) //   Kind of like our constraints */
                    
                    Spacer( )
                    
                    // '$' for containers
                    TextField( "EmailID", text: $emailID )
                        .textFieldStyle( .roundedBorder )
                        .padding( 100 )
                    
                    /*Toggle(isOn: , label: {
                     Text("This is our label")
                     })*/
                    
                    //  Secure field encrypts the
                    //  plaintext in the password field
                    SecureField("Password", text: $password )
                        .textFieldStyle(.roundedBorder)
                        .padding ( 100 )
                    
                    HStack
                    {
                        
                        // You can't put print here. It only accepts
                        // your destination
                        NavigationLink("Login") {
                            ListScreen()
                        }.buttonStyle(.borderedProminent)
                        
                        
                        NavigationLink("Login Details") {
                            //isDisplayed = true
                            DetailsScreen( data: password/*isShown: $isDisplayed*/)
                        }.buttonStyle(.borderedProminent)
                        
                        //  Navigate to our grid screen
                        NavigationLink("Pokemon Grid") {
                            GridScreen( )
                        }.buttonStyle(.borderedProminent)
                    }
                    HStack 
                    {
                        NavigationLink("ZStack View") 
                        {
                            SwiftUIZStack()
                        }.buttonStyle(.borderedProminent)
                        
                        NavigationLink("Web View") 
                        {
                            SwiftUIWebView()
                        }.buttonStyle(.borderedProminent)
                        
                        NavigationLink("Tab Bar") 
                        {
                            TabBarUIViews()
                        }.buttonStyle( .borderedProminent )
                        
                        NavigationLink("Geometric Reader") 
                        {
                            GeometricReaderView()
                        }.buttonStyle( .borderedProminent )
                    }
                    
                    
                    Spacer()
                    
                }
                
                .padding()
                
                //  If you want to give your view a
                //  Title.
                .navigationTitle( "Login Screen" )
                .navigationBarTitleDisplayMode( .inline )
            }
            //  Viewbuilder is like
            //  you're creating a function
            //  for view
        }/*.sheet(isPresented: $isDisplayed ) {
            DetailsScreen()*/
        }
    }


#Preview {
    //@State var email = "abc@cba.com"
    //@State var password = "blah1234"
    return ContentView(/*emailID: email, password: password*/)
}
