import SwiftUI
import HealthKit
import UserNotifications



struct ContentView: View {
    @State private var showingPopover = false
        var body: some View {

            VStack {

                Text("")
             
                    .onAppear(perform: {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                            if success {
                                let content = UNMutableNotificationContent()
                                content.title = "PythaBios"
                                content.subtitle = "Effettua una passeggiata medio-lunga in natura"
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
                NavigationLink(destination: DestinationMenu()){
            ZStack {
                Image("sfondo")
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .edgesIgnoringSafeArea(.all)
                    
                }
        
                }}}}
   
    
   

struct Step: Identifiable {
    let id = UUID()
    let count: Int
    let date: Date
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
