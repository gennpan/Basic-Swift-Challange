//
//  SegmentedView.swift
//  PythaBios
//
//  Created by alessio on 26/10/21.
//

import SwiftUI

struct SegmentedView: View {
    @State private var authPath: Int? = nil

       /* ... */

       var body: some View {
           VStack {
               Picker(selection: Binding<Int>(
                   get: { self.authPath ?? 0 },
                   set: { tag in
                       withAnimation { // needed explicit for transitions
                           self.authPath = tag
                       }
                   }),
                      label: Text("Authentication Path")) {
                   Text("Maps").tag(0)
                   Text("Steps").tag(1)
               }
               .pickerStyle(SegmentedPickerStyle())

               Spacer()

               ZStack {
                   Rectangle().fill(Color.clear)
                   if nil == authPath {
MapsView()
                   }

                   if authPath == 0 {
                       MapsView()
                   }

                   if authPath == 1 {
StepCounterView()
                       
                   }
               }

               Spacer()
           }
           .padding()
           .background(Color("Color.Background").edgesIgnoringSafeArea(.all))
       }
}
struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedView()
    }
}
