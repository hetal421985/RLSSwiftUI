//
//  UserDetailView.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 03/01/24.
//

import SwiftUI

struct UserDetailView: View {
    
    /// Dismiss View
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            /// Header View
            HStack{
                /// Back Button
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image("back")
                }
                /// Header
                Text("詳細情報")
                .font(.custom(Constant.Font.kMedium, size: Constant.Font.kBoldSize))
                .foregroundColor(.primary.opacity(0.6))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                
            }
            .padding([.trailing,.leading,.bottom], 18)
            /// Spacer
            Spacer()
                .frame(height: Constant.SpaceHeight.kMinimumSpaceHeight)
            /// Date View
            VStack{
                Text("出勤許可日")
                .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
                .foregroundColor(.primary.opacity(0.5))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Text("2999/12/31")
                .font(.custom(Constant.Font.kBold, size: Constant.Font.kBoldSize))
                .foregroundColor(.primary)
                .padding(.top,1)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding([.trailing,.top,.leading], 18)
            /// In-Out Time View
            HStack {
                VStack{
                    Text("出勤時刻")
                    .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
                    .foregroundColor(.primary.opacity(0.5))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    Text("2023/12/31 1:11")
                    .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
                    .foregroundColor(.primary.opacity(0.5))
                    .padding(.top,1)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                }
                VStack{
                    Text("退勤時刻")
                    .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
                    .foregroundColor(.primary.opacity(0.5))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                    Text("2023/12/31 1:11")
                    .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
                    .foregroundColor(.primary.opacity(0.5))
                    .padding(.top,1)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                }
            }
            .padding([.trailing,.top,.leading], 18)
            /// Dotted Line
            Rectangle()
                .fill(Color.clear)
                .frame(height: 1, alignment: .bottom)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .foregroundColor(Color(UIColor.gray))
                )
                .padding([.trailing,.top,.leading], 18)
            /// User View
            VStack{
                Text("社員名")
                .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
                .foregroundColor(.primary.opacity(0.5))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Text("あべ松秀男")
                .font(.custom(Constant.Font.kBold, size: Constant.Font.kRegularSize))
                .foregroundColor(.primary)
                .padding(.top,1)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding([.trailing,.top,.leading], 18)
            /// Company View
            VStack{
                Text("会社名")
                .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
                .foregroundColor(.primary.opacity(0.5))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Text("（株）JERA")
                .font(.custom(Constant.Font.kBold, size: Constant.Font.kRegularSize))
                .foregroundColor(.primary)
                .padding(.top,1)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding([.trailing,.top,.leading], 18)
            /// Email View
            VStack{
                Text("メールアドレス")
                .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
                .foregroundColor(.primary.opacity(0.5))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                Text(verbatim:"Hideo.Abematsu@jera.co.jp")
                .font(.custom(Constant.Font.kBold, size: Constant.Font.kRegularSize))
                .foregroundColor(.primary)
                .padding(.top,1)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            .padding([.trailing,.top,.leading], 18)
            /// Bottom View
            HStack {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("退勤")
                    .font(.custom(Constant.Font.kMedium, size: Constant.Font.kRegularSize))
                    .foregroundColor(.white)
                })
                .frame(width: 180, height: 60)
                .background(.red)
                .cornerRadius(30)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("出勤")
                    .font(.custom(Constant.Font.kMedium, size: Constant.Font.kRegularSize))
                    .foregroundColor(.white)
                })
                .frame(width: 180, height: 60)
                .background(.green)
                .cornerRadius(30)
            }
            .padding([.top],180)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    UserDetailView()
}
