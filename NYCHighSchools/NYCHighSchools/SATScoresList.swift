//
//  SwiftUIView.swift
//  NYCHighSchools
//
//  Created by Russell Campbell on 11/14/23.
//

import SwiftUI

struct SATScoresList: View {
    
    var networkManager = NetworkManager()
    var data: String
    
    @State var scoresListArray = [Scores]()
    
    var body: some View 
    {
        NavigationStack
        {
            VStack
            {
                //  Capture the School ID from previous screen.
                //  This will help us with our if statement
                let dbn: String = data
                
                //  Display the School ID from previous screen
                Text( dbn )

                
                List ( scoresListArray ) { score in
                    
                    let dbn2 = score.id
                    
                    Text( "\(score.schoolName) (\(dbn2))" )
                    Text( "SAT Reading: " + score.readingScore )
                    Text( "SAT Math: " + score.mathScore )
                    Text( "SAT Writing: " + score.writingScore )
                    
                        if ( dbn == dbn2 )
                        {
                            if ( scoresListArray.isEmpty ) {
                              Text("There are no SAT scores here!")
                            }
                            else {
                                Text( "\(score.schoolName) (\(dbn2))" )
                                Text( "SAT Reading: " + score.readingScore )
                                Text( "SAT Math: " + score.mathScore )
                                Text( "SAT Writing: " + score.writingScore )
                            }
                        }

                 
                }
            }
        }.padding()
         .onAppear() 
        {
                
                Task
                {
                    scoresListArray = try await networkManager.getDataFromNetworkLayer( url: URL(string: APIEndPoints.scoreSATEndpoint)!, modelType: [Scores].self )
                    
    //                DispatchQueue.main.async
    //                {
    //                    self.schoolListArray = schoolListArray.data
    //                }
                }
                
            }
    }
}

#Preview {
    SATScoresList( data: "DBN#" )
}
