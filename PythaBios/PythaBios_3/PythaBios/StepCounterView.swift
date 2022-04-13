//
//  StepCounterView.swift
//  PythaBios
//
//  Created by Gennaro Panico on 25/10/21.
//

import SwiftUI
import HealthKit
import MapKit




struct StepCounterView: View {
    
    private var healthStore: HealthStore?
    @State private var steps: [Step] = [Step]()
    
    init() {
            healthStore = HealthStore()
    }
    
    private func updateUIFromStatistics( statisticsCollection: HKStatisticsCollection) {
        
        let startDate = Calendar.current.date(byAdding: .day, value: -6, to: Date())!
        let endDate = Date()
        
        statisticsCollection.enumerateStatistics(from: startDate, to: endDate) { (statistics, stop) in
            
            let count = statistics.sumQuantity()?.doubleValue(for: .count())
            
            let step = Step(count: Int(count ?? 0), date: statistics.startDate)
            steps.append(step)
       
            
        }
    }
    
    
    
    var body: some View{
            List(steps, id: \.id) {  step in
                VStack(alignment: .leading){
                    if(step.count<1000){
                        Text("\tSteps performed: \(step.count)\t")
                                .background(Color.red)
                                .font(.system(.footnote, design: .rounded).bold())
                                .foregroundColor(.white)
                                .cornerRadius(5)
                    }
                    
                    else if(step.count>1000 && step.count<2000){
                        Text("\tSteps performed: \(step.count)\t")
                                .background(Color.orange)
                                .font(.system(.footnote, design: .rounded).bold())
                                .foregroundColor(.white)
                                .cornerRadius(5)
                    }
                    else if(step.count>2000 && step.count<2500){
                        Text("\tSteps performed: \(step.count)\t")
                                .background(Color.yellow)
                                .font(.system(.footnote, design: .rounded).bold())
                                .foregroundColor(.white)
                                .cornerRadius(5)
                    }
                    
                    else if(step.count>2500 && step.count<=3000){
                        Text("\tSteps performed: \(step.count)\t")
                                .background(Color.green)
                                .font(.system(.footnote, design: .rounded).bold())
                                .foregroundColor(.white)
                                .cornerRadius(5)
                    }
                    
                    
                
                    if(step.count<3000){
                        Text(" \(3000-step.count) steps left")}
                    if(step.count>2000 && step.count<3000){
                        Text("You're almost there \(3000-step.count) steps left")}
                    else if(step.count>=3000){
                        Text("Daily steps completed!")
                    }
                Text(step.date, style: .date)
                    .opacity(0.5)
                    
             }
            }
            
                .onAppear {
                    if let healthStore = healthStore {
                        healthStore.requestAuthorization { success in
                            if success {
                                healthStore.calculateSteps { statisticsCollection in if let statisticsCollection = statisticsCollection {
    //                                update the UI
                                    updateUIFromStatistics(statisticsCollection: statisticsCollection)
                                    }
                                }
                            }
                        }
                    }
                }
        
                .tabItem {
                  Label("Steps", systemImage: "circle.hexagongrid.circle.fill")
            }
        }
    }




struct StepCounterView_Previews: PreviewProvider {
    static var previews: some View {
        StepCounterView()
    }
}
