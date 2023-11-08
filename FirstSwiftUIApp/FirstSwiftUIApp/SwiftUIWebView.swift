//
//  SwiftUIWebView.swift
//  FirstSwiftUIApp
//
//  Created by Russell Campbell on 11/7/23.
//

import SwiftUI
import WebKit

//  UIViewRepresentable is a wrpper in UIView you use to integrate your view into SwiftUI's hierarchy
struct SwiftUIWebView: UIViewRepresentable {
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://bulbapedia.bulbagarden.net/wiki/Johto")
        else { return }
        
        let request = URLRequest( url: url)
        
        uiView.load(request)
    }
    
    //  Type alias is like giving a different name
    typealias UIViewType = WKWebView
    
    func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
        }
    }
    




    /*var body: some View {
        Text()
    }*/


#Preview {
    SwiftUIWebView()
}
