//
//  Home.swift
//  Acromine Project
//
//  Created by David on 11/5/21.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = ViewModel()
    @State var text: String = ""
    @State var text2: String = ""
    @State private var showFavoriteOnly = false
    var body: some View {
        NavigationView{
            VStack{
                HStack(alignment: .center){
                    VStack{
                        TextField("Enter abrev", text: $text)
                            .frame(height: 35)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                            .padding(.leading)
                        
                        if (showFavoriteOnly){
                            TextField("Enter acrom", text: $text2)
                                .frame(height: 35)
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                                .padding(.leading)
                        }
                        
                    }
                    Button {
                        viewModel.requestCode(abre: text, word: text2)
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .padding(.horizontal, 10)
                            .frame(height: 40)
                    }
                    
                }
                .frame(height: 40)
                
                Toggle(isOn: $showFavoriteOnly, label: {
                    HStack{
                        Spacer()
                        Text("Advanced search")
                        
                    }
                    
                }).padding(.trailing,10)
                    .padding(.top, 25)
                
                if let element = viewModel.acromine {
                    if element.isEmpty {
                        Text("Not found word..")
                            .padding()
                        Spacer()
                    } else {
                        
                        List{
                            ForEach(viewModel.acromine![0].lfs, id:\.self){ acromine in
                                NavigationLink(destination: DetailAcronim(lfsItem: acromine)){
                                    ItemAcronim(lfsItem: acromine)
                                }
                            }
                        }
                        .listStyle(GroupedListStyle())
                    }
                    
                }
                
            }
            .navigationTitle("Acronim")
            .padding()
        }
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
