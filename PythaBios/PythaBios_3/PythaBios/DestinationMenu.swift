//
//  DestinationMenu.swift
//  PythaBios
//
//  Created by Gennaro Panico on 23/10/21.
//

import SwiftUI


struct DestinationMenu: View {
    @Environment (\.presentationMode) var presentationMode

      //isFirstLaunch will default to true until it is set to false in the sheet and
      //then stored in UserDefaults
      @AppStorage("isFirstLaunch") var isFirstLaunch: Bool = true

    
    var body: some View {

        
        VStack {

            Text("")
         
                .onAppear(perform: {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            let content = UNMutableNotificationContent()
                            content.title = "PythaBios"
                            content.subtitle = "Go for a walk in nature!"
                            content.sound = UNNotificationSound.default


                            let triggerDaily = DateComponents(calendar: Calendar.current, hour: 10, minute: 30)
                            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)


                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                            // aggiunge la notification request
                            UNUserNotificationCenter.current().add(request)
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                })
        }
        
        NavigationView {

        ZStack {
                AngularGradient(
                    gradient: ColorConstants.backgorundGradient,
                    center: .bottomTrailing,
                    startAngle: .degrees(195),
                    endAngle: .degrees(340))
                    .ignoresSafeArea()
              
        
        
        
        ScrollView{

                        NavigationLink(destination: DestinationView_1()){
                            ZStack {
                                Image("yoga")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(15)
                                .padding()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                                        .opacity(0.2)
                                        .blur(radius: 3)
                                        .padding()
                                )
                            Text("Yoga")
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.black)
                                .foregroundColor(.black)
                                
                        }
                    }
  
      NavigationLink(destination: SegmentedView()){
          ZStack {
            Image("step")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .cornerRadius(15)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .opacity(0.1)
                    .blur(radius: 3)
                    .padding()
            )
        Text("Steps&Where")
            .font(.system(.title, design: .rounded))
            .fontWeight(.black)
            .foregroundColor(.gray)
           
    
            }

        }
    

            }
    .navigationTitle("Activity")
        }
            
        .sheet(isPresented: $isFirstLaunch) {
            
            
            ZStack{
              
                Image("sfondo")
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .edgesIgnoringSafeArea(.all)
                Text("PythaBios")
                    .font(.system(size: 40))
                    .padding(.top, -300)
                    .font(.system(.title, design: .rounded).bold())
                    .foregroundColor(.black)
                Text("Pythagorikos Bios is a particoular lifestyle founded by Pythagorean philosophers to contrast mental uneasiness.")
                    .font(.system(size: 20))
                    .padding()
                    .font(.system(.title, design: .rounded).bold())
                    .foregroundColor(.white)
                    
            VStack(spacing: 40) {
                      // ContentView()
                       
                       Button("Swipe Down") {
                           isFirstLaunch = false
                       }.font(.system(.title, design: .rounded).bold())
                    .padding()
                           .shadow(color: Color.blue, radius: 16, x: 0, y: 0)
                           .foregroundColor(.white)
                           .padding(.top, 600)
                          
                                   }
            }}
            
    }
}
}

struct DestinationMenu_Previews: PreviewProvider {
static var previews: some View {
    DestinationMenu()
    }
}


struct ColorConstants {
    static let topColor1            = Color.init(red: 255/255, green: 255/255, blue: 255/255)
    static let topColor2            = Color.init(red: 0/255, green: 10/255, blue: 255/255)
    static let bottomColor1         = Color.init(red: 30/255, green: 150/255, blue: 250/255)
    static let bottomColor2         = Color.init(red: 255/255, green: 255/255, blue: 255/255)
    
    static let backgorundGradient = Gradient(colors: [bottomColor1, bottomColor2, topColor1, topColor2])
}
