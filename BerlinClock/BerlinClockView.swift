//
//  BerlinClockView.swift
//  BerlinClock
//
//  Created by Aisaule Sibatova on 15.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var time: [String] = []
    @State var regularTime: String = ""
    @State private var date = Date()

    var body: some View {
        ZStack {
                Color.backGroundcolor
                .edgesIgnoringSafeArea(.all)
        VStack {
            if (time.count > 0) {
                HStack {
                    Text("Time is " + regularTime)
                        .fontWeight(.bold)
                        .font(.system(size: 17))
                }
                
                ZStack{
                RoundedRectangle(cornerRadius: 12)
                .frame(width: 358, height: 312)
                .foregroundColor(.white)
       
               VStack {
                                        
                HStack {
                    Circle()
                        .fill(time[0] == "Y" ? Color.yellow : Color.secondsOff)
                        .frame(width: 56, height: 56)
                }
                
                HStack {
                    ForEach((1..<5)) { i in
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .fill(time[i] == "R" ? Color.red : Color.hoursOff)
                            .frame(width: 74, height: 32)
                    }
                }
                
                HStack {
                    ForEach((5..<9)) {i in
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .fill(time[i] == "R" ? Color.red : Color.hoursOff)
                            .frame(width: 74, height: 32)
                    }
                }
                
                HStack {
                    Group {
                        ForEach((9..<20)) {i in
                            RoundedRectangle(cornerRadius: 2, style: .continuous)
                                .fill(time[i] == "Y" ? Color.yellow : (time[i] == "R" ? Color.red : Color.minutesOff))
                                .frame(width: 21.5, height: 32)
                        }
                    }
                }
                
                HStack {
                    ForEach((20..<24)) {i in
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .fill(time[i] == "Y" ? Color.yellow : Color.minutesOff)
                            .frame(width: 73, height: 32)
                    }
                    }
                                    }
                }
                
                ZStack {
                RoundedRectangle(cornerRadius: 12)
                .frame(width: 358, height:54)
                .foregroundColor(.white)
               
                    HStack(spacing: 180) {
                DatePicker(
                    "Insert time",
                    selection: $date,
                    displayedComponents: .hourAndMinute
                ).onChange(of: date, perform: { value in
                    displayTime()
                })
                    .environment(\.locale, Locale(identifier: "ru-RU"))
                    .padding(20)
            }
      }
 }
//            Spacer()
        }.padding(20)
        .onAppear {
            displayTime()
        }
        }
    }
    
    func displayTime() {

            let date = date
            let calendar = Calendar.current
            let seconds = calendar.component(.second, from: date)
            let minutes = calendar.component(.minute, from: date)
            let hours = calendar.component(.hour, from: date)
            let berlinClock = BerlinClock()
            let formatter = DateFormatter()
            formatter.dateFormat = "hh:mm:ss"
            regularTime = formatter.string(from: date)
            time = berlinClock.rawBerlinClock(hours, minutes, seconds).map{String($0)}
            print(berlinClock.berlinClock(hours, minutes, seconds))

    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

