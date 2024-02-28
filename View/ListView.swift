//
//  ListView.swift
//  MVVM To_Do
//
//  Created by Chandra on 05/02/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel : ListViewModel
    
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty{
                NoView()
            }
            else  {
                List{
                    ForEach(listViewModel.items){
                        items in
                        //                ListRowView(title: items)
                        ListRowView(item: items)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateitem(item: items)
                                }
                            }
                        
                    }.onDelete(perform: listViewModel.deleteitems)
                        .onMove(perform: listViewModel.moveItem)
                    
                    //            Text("Hi")
                    //            ListRowView(title: "This is the 1st")
                }.listStyle(PlainListStyle())
            }}
                    .navigationTitle("To Do List 😁")
                    .navigationBarItems(leading: EditButton(),trailing: NavigationLink("Add",destination: AddView()))
            }
        }
        
    
  



#Preview {
    NavigationView{
        
        
        ListView()
    }
    .environmentObject(ListViewModel())
}

