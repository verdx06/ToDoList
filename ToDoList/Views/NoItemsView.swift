//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Виталий Багаутдинов on 29.08.2024.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Нет ни одного пункта!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 8)
                Text("Ты продуктивный человек? Я думаю тебе нужно добавить нес колько пунктов в твои заметки")
                    .padding(.bottom, 20)
                NavigationLink  {
                    AddView()
                } label: {
                    Text("Добавить элемент🥳")
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .foregroundColor(.white)
                        .font(.headline)
                        .background(animate ? Color.orange : Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? Color.orange.opacity(0.5) : Color.blue.opacity(0.5),
                    radius: animate ? 30 : 10,
                x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)

            }.frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear (perform: animationForButton)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func animationForButton() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {animate.toggle()}
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("lol")
    }
}
