//
//  CustomRow.swift
//  SwiftUI App(Homework for OTUS)
//
//  Created by Идель Юсупов on 08.12.2020.
//

import SwiftUI

struct CustomRow: View {
    var content: String
    var body: some View {
        HStack {
            Image(content)
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .cornerRadius(50)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.green, lineWidth: 5))
                .aspectRatio(contentMode: .fit)
            NavigationLink(destination:
                            Image(content)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .navigationBarTitle(Text(content)))
            {
                Text(content)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.green)
                    .cornerRadius(8)
            }
            Spacer()
        }
    }
}
