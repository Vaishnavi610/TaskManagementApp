//
//  TaskView.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 31/01/24.
//

import SwiftUI

struct TaskView: View {
    
    @Binding var tasks : Tasks_data
    @Binding var timeDistance : Int
    @Binding var showButton : Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 15, content: {
            
            Text("\(tasks.createddate?.format("HH : MM a") ?? "")")
                .font(.custom(fontNames.semiBold.rawValue, size: 16))
                .foregroundStyle(tasks.iscompletd ? Color.gray : Color.black)
                .offset(y: 10)
            
             Circle()
                .frame(width: 10, height: 10)
                .foregroundStyle(tasks.iscompletd ? Color.gray : Color.black)
                .offset(y: 10)
            VStack(alignment: .leading, spacing: 10, content: {
                Text(tasks.taskaname ?? "")
                    .font(.custom(fontNames.semiBold.rawValue, size: 16))
                    .foregroundStyle(Color.white)
                
            HStack(spacing: 0){
                    Text(tasks.note ?? "")
                        .font(.custom(fontNames.regular.rawValue, size: 12))
                        .foregroundStyle(Color.white)
                Spacer()
                Label(
                    title: { Text("1 hrs").foregroundStyle(Color.white).font(.custom(fontNames.medium.rawValue, size: 14)) },
                    icon: { Image(systemName: "alarm.fill").foregroundStyle(Color.white) }
                )
                .offset(y: 0)
            }
            }).padding(.horizontal, 15)
            .frame(height: 80)
            .background( tasks.iscompletd ? Color.gray : setColor(tasks.themefortask ?? ""), in: .rect(cornerRadius: 10))
            .shadow(color: Date.now.format("HH : MM a") == tasks.createddate?.format("HH : MM a") ? .gray : .clear, radius: 10, y: 10)
        })
       
    }

}

#Preview {
    homeView()
}
