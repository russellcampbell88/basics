//
//  ContentView.swift
//  NYCHighSchools
//
//  Created by Russell Campbell on 11/13/23.
//

import SwiftUI 

struct HighSchoolListView: View {
    
    var networkManager = NetworkManager()
    
    //  Declare an array of structs for each school
    @State var schoolListArray = [School]()

    
    var body: some View 
    {
        NavigationStack
        {
            VStack
            {
                Text( "List of High Schools" )
                
                List ( schoolListArray ) { school in

                    //  Variable to track the school ID
                    let dbn1 = school.id
                    
                    Section
                    {
                        NavigationLink( "\(school.schoolName) (\(dbn1))"  ) 
                        {
                            SATScoresList( data: dbn1 )
                        }
                        
                    }
                    
                }
            }
        }
        .padding()
        .onAppear() {
            
            Task
            {
                schoolListArray = try await networkManager.getDataFromNetworkLayer( url: URL(string: APIEndPoints.highSchoolEndpoint)!, modelType: [School].self )
                
//                DispatchQueue.main.async
//                {
//                    self.schoolListArray = schoolListArray.data
//                }
            }
            
        }
    }
}

#Preview 
{
    HighSchoolListView( )
}
