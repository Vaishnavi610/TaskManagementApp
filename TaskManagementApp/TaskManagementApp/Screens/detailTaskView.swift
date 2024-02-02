//
//  detailTaskView.swift
//  TaskManagementApp
//
//  Created by vaishnavi Acharekar on 02/02/24.
//

import SwiftUI

struct detailTaskView: View {
    @Binding var popScreen : Bool
    @Binding var selectedTasks : Tasks_data
    
    @StateObject var viewModel = tasksViewModel()
    
    var body: some View {
        VStack(spacing: 60){
            HStack(alignment: .center, spacing: 10, content: {
                VStack(alignment: .leading, spacing: 10, content: {
                    Text(selectedTasks.taskaname ?? "")
                        .font(.custom(fontNames.semiBold.rawValue, size: 28))
                    
                    Text(selectedTasks.note ?? "")
                        .font(.custom(fontNames.regular.rawValue, size: 18))
                })
                Spacer()
            })
            .padding(.horizontal)
            
            VStack(alignment: .leading, spacing: 20, content: {
                
                HStack(alignment: .center, spacing: 10, content: {
                    Image(systemName: "alarm.waves.left.and.right.fill")
                        .font(.custom(fontNames.medium.rawValue, size: 25))
                    Spacer()
                    Text("Scheduled on \(selectedTasks.createddate?.format("E dd") ?? "") at \(selectedTasks.createddate?.format("HH MM a") ?? "")")
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                })
                Divider()
                
                HStack(alignment: .center, spacing: 10, content: {
                    Text("Repeat")
                        .font(.custom(fontNames.medium.rawValue, size: 18))
                    Spacer()
                    Text(selectedTasks.repeatedvalue ?? "")
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                })
                Divider()
                
                HStack(alignment: .center, spacing: 10, content: {
                    Text("Set an alarm")
                        .font(.custom(fontNames.medium.rawValue, size: 18))
                    Spacer()
                    Text(selectedTasks.setalarm ? "ON" : "Off")
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                })
                Divider()
                
                HStack(alignment: .center, spacing: 10, content: {
                    Text("Alert")
                        .font(.custom(fontNames.medium.rawValue, size: 18))
                    Spacer()
                    Text(selectedTasks.alertvalue ?? "")
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                })
                Divider()
                
                HStack(alignment: .center, spacing: 10, content: {
                    Text("Theme")
                        .font(.custom(fontNames.medium.rawValue, size: 18))
                    Spacer()
                    
                    Circle()
                        .foregroundStyle(setColor(selectedTasks.themefortask ?? "gray"))
                        .frame(width: 25, height: 25)
                    
                })
                Divider()
                
                HStack(alignment: .center, spacing: 10, content: {
                    Text("URL")
                        .font(.custom(fontNames.medium.rawValue, size: 18))
                    Spacer()
                    
                    Text(selectedTasks.urlattachement?.absoluteString ?? "")
                        .font(.custom(fontNames.regular.rawValue, size: 16))
                    
                })
                Divider()
            })
            .padding(.horizontal)
            
            VStack(alignment: .center, spacing: 10, content: {
                Button(action: {
                    selectedTasks.iscompletd = true
                    viewModel.updateIsComplete(selectedTasks, isCompleted: selectedTasks.iscompletd) { success in
                        if success {
                            popScreen = false
                        }else{
                            
                        }
                    }
                    
                }, label: {
                    Text("Mark as Completed")
                        .font(.custom(fontNames.semiBold.rawValue, size: 18))
                        .foregroundStyle(Color.white)
                        .background(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 235, height: 50)
                                .foregroundStyle(selectedTasks.iscompletd ? Color.gray.opacity(0.6) : Color.black)
                                .shadow(color: .black.opacity(0.4), radius: 10, x: 10)
                        })
                        .frame(width: 235, height: 50)
                       
                })
                .disabled(selectedTasks.iscompletd ? true : false)
                
                Button(action: {
                    viewModel.deleteTask(selectedTasks) { success in
                        if success{
                            popScreen = false
                        }else{
                            
                        }
                    }
                }, label: {
                    Text("Delete event")
                        .font(.custom(fontNames.medium.rawValue, size: 18))
                        .foregroundStyle(Color.red)
                        .background(content: {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 1)
                                .frame(width: 235, height: 50)
                                .shadow(color: .black.opacity(0.4), radius: 10, x: 10)
                        })
                        .frame(width: 235, height: 50)
                        
                })
            })
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(content: {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    popScreen = false
                }, label: {
                    Image(systemName: "arrow.backward")
                        .foregroundStyle(Color.black)
                })
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    
                }, label: {
                      Text("Edit")
                        .foregroundStyle(Color.black)
                })
            }
        })
    }
}

#Preview {
    detailTaskView(popScreen: .constant(false), selectedTasks: .constant(Tasks_data()))
}
