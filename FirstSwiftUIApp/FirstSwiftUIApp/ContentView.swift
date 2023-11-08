//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/6/23.
//

import SwiftUI



struct ContentView: View 
{
    
    // ~Remember: Structs are immutable by default

    @State var emailID: String = ""
    @State var password: String = ""
    
    var body: some View
    {
        //  Wrap NavigationStack around our ContentView
        //  to essentially serve the same function as
        //  Navigation View Controller.
        //  Stack because we're dealing with structs.
        NavigationStack // iOS 16+
        {
           
            //  Align one on top of another
            VStack ( spacing: 20 )
            {
                
                Image(systemName: "globe") //UIImage
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding( 50 ) //   Kind of like our constraints
                
                Text("Welcome to PokemonUI")
                    .font( .title )
                    .foregroundStyle( .red )
                    .frame(maxWidth: .infinity)
                    .padding( 10 )
                
                Spacer( )
                
                // '$' for containers
                TextField( "EmailID", text: $emailID )
                    .textFieldStyle( .roundedBorder )
                
                /*Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, label: {
                    Text("This is our label")
                })*/
                
                //  Secure field encrypts the
                //  plaintext in the password field
                SecureField("Password", text: $password )
                    .textFieldStyle(.roundedBorder)
                HStack{
                    
                    
                    // You can't put print here. It only accepts
                    // your destination
                    NavigationLink("Login") {
                        ListScreen()
                    }.buttonStyle(.borderedProminent)
                    
                    
                    NavigationLink("Login Details") {
                        DetailsScreen( data: password )
                    }.buttonStyle(.borderedProminent)
                    
                    //  Navigate to our grid screen
                    NavigationLink("Pokemon Grid") {
                        GridScreen( )
                    }.buttonStyle(.borderedProminent)
                }
                HStack {
                    NavigationLink("ZStackView") {
                        SwiftUIZStack()
                    }.buttonStyle(.borderedProminent)
                    
                    NavigationLink("WebView") {
                        SwiftUIWebView()
                    }.buttonStyle(.borderedProminent)
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
    }
}

#Preview {
    //@State var email = "abc@cba.com"
    //@State var password = "blah1234"
    return ContentView(/*emailID: email, password: password*/)
}
