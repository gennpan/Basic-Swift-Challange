//
//  DestinationView_1.swift
//  PythaBios
//
//  Created by Gennaro Panico on 22/10/21.
//

import SwiftUI
import AVKit

struct DestinationView_1: View {
    var body: some View {

        
        TabView {
            
            
            ScrollView {
                Text("Adho mukha svanasana")
                    .multilineTextAlignment(.center).font(.system(size: 45))
                Image("adho_mukha_svanasana")
              
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "video1", withExtension: "mp4")!))
                    .frame(height: 400)
                VStack{
                 
                    
                            Text("Start from the cat position, on all fours with the shoulders above the wrists and the pelvis above the knees. \n\n\n\nExhale, press your hands to the ground and straighten your legs bringing your buttocks towards the sky.\n\n\n\nAt this point try to relax your back and bring all your weight backwards.\n\n\n\nIf you can, bring your heels to the ground, otherwise keep them raised.\n\n\n\nStay in this position for 10 full breaths.\n\n").padding()
                                 .font(.system(.title, design: .rounded).bold())
                                 .foregroundColor(.blue)
                                

                }
               
            }

            .tabItem {
              Label("First", systemImage: "1.circle.fill")
            }
          
            ScrollView {
                Text("Paschimottanasana")
                    .multilineTextAlignment(.center).font(.system(size: 45))
                Image("paschimottanasana")
            
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "video5", withExtension: "mp4")!))
                    .frame(height: 400)
                
                Text("Start from Dandasana, the position of the stick, that is sitting with the legs extended frontally and the torso erect. \n\n\n\nInhale, stretch upwards with your hands and in the subsequent exhalation bend forward. \n\n\n\nIf you can grab your toes with your hands, otherwise place them on your shins or ankles.\n\n\n\n Once in the position, breathe deeply and try to reach forward, not down. Bending is only a consequence of proper forward stretching.\n\n\n\nStay in this position for 20 full breaths.\n\n").padding()
                    .font(.system(.title, design: .rounded).bold())
                    .foregroundColor(.blue)
            }
            .tabItem {
              Label("Second", systemImage: "2.circle.fill")
                    }
          
            
            ScrollView{
                Text("Halasana")
                    .multilineTextAlignment(.center).font(.system(size: 45))
                Image("halasana")

                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "video3", withExtension: "mp4")!))
                    .frame(height: 400)
            Text("Once out of Paschimottanasana, roll onto your back and bring your feet over your head, straighten your legs and bring your buttocks to the sky. \n\n\n\nThe hands instead go to the opposite side of the legs and the fingers intertwine.\n\n\n\nIn this position it is important to keep the chest open and avoid tension in the shoulder area. To facilitate the position you can put a folded mat under the legs. shoulders to make the bend in the neck less intense.\nStay in this position for 10 full breaths. \n\n").padding()
                    .font(.system(.title, design: .rounded).bold())
                    .foregroundColor(.blue)
           
        
            }
            .tabItem {
              Label("Third", systemImage: "3.circle.fill")
        }
        
            
            ScrollView{
                Text("Ananda Balasana")
                    .multilineTextAlignment(.center).font(.system(size: 45))
                Image("ananda_balasana")
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "video2", withExtension: "mp4")!))
                    .frame(height: 400)
            Text("At this point rest your back on the ground, bring your knees to your chest and grab your feet with your hands.\n\n\n\nThis position is called the happy child because it is very often taken by children when they play carefree. \n\n\n\nStay in this position for 20 deep breaths and try to remember when you were a child and played happily, thoughtlessly.\n\n").padding().font(.system(.title, design: .rounded).bold()).foregroundColor(.blue)

            }
            .tabItem {
              Label("Fourth", systemImage: "4.circle.fill")
            }
            ScrollView{
                Text("Svanasana")
                    .multilineTextAlignment(.center).font(.system(size: 45))
                Image("svanasana")
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "video4", withExtension: "mp4")!))
                    .frame(height: 400)
            Text("Finally, lie down on the ground and let your legs relax outwards, your hands are pointing towards the sky and relax completely for 5 minutes in the final relaxation.\n\n").padding()
                    .font(.system(.title, design: .rounded).bold())
                    .foregroundColor(.blue)
   
            }
            .tabItem {
              Label("Fifth", systemImage: "5.circle.fill")
            }
            
        }
        
      
  
                }

}
struct DestinationView_1_Previews: PreviewProvider {
static var previews: some View {
    
    DestinationView_1()
}
}
