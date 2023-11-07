//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/6/23.
//

import SwiftUI


// This is our main struct for the Content View
struct ContentView: View 
{
    
    // Structs are immutable by default

    @State var emailID: String = ""
    @State var password: String = ""
    
    var body: some View
    {
        NavigationStack 
        {
            VStack ( spacing: 20 )
            {
                
                Image(systemName: "globe") //UIImage
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding( 50 ) //   Kind of like our constraints
                
                Text("Welcome to SwiftUI!!!")
                    .font( .title )
                    .foregroundStyle( .red )
                    .frame(maxWidth: .infinity)
                    .padding( 10 )
                
                Spacer( )
                
                TextField( "EmailID", text: $emailID )
                    .textFieldStyle( .roundedBorder )
                
                Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, label: {
                    Text("This is our label")
                })
                
                //  Secure field encrypts the
                //  plaintext in the password field
                SecureField("Password", text: $password )
                    .textFieldStyle(.roundedBorder)
                
                Button("Login") {
                    print("Login Buton Tapped")
                }.buttonStyle(.borderedProminent)
                

                // You can't put print here. It only accepts
                // your destination
                NavigationLink("List Link") {
                    ListScreen()
                }.buttonStyle(.borderedProminent)
                
                //  The show must go on
                NavigationLink("Details") {
                    DetailsScreen( data: "SwiftUIData" )
                }.buttonStyle(.borderedProminent)
                
                //  Navigate to our grid screen
                NavigationLink("Grid") {
                    GridScreen( )
                }.buttonStyle(.borderedProminent)
                
                Spacer()
                
                Button("Tap Me") {
            
                }
                //Text("LearnING") //UILabel
            }
            
            .padding()
            
            //  If you want to give your view a
            //  Title.
            .navigationTitle( "Login Screen" )
            .navigationBarTitleDisplayMode( .inline )
        }
    }
}

#Preview {
    //@State var email = "abc@cba.com"
    //@State var password = "blah1234"
    return ContentView(/*emailID: email, password: password*/)
}
