//
//  UserListView.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 03/01/24.
//

import SwiftUI
import SwiftData

struct UserListView: View {
    
    /// Model Context View
    @Environment(\.modelContext) private var modelContext
    
    /// Dismiss View
    @Environment(\.presentationMode) var presentationMode
    
    /// Array User List
    @Query(sort: \UserListModel.id) var arrUserList: [UserListModel]
   
    /// User List API manager
    private var apiManagerUserList = UserListAPIManager()
    
    /// Pushed To User Detail
    @State private var pushedToUserDetail = false
    
    /// Serach Text
    @State private var searchText: String = ""
    
    var body: some View {
        GeometryReader(content: { geometry in
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
                    Text("（株）JERA")
                    .font(.custom(Constant.Font.kMedium, size: Constant.Font.kBoldSize))
                    .foregroundColor(.primary.opacity(0.6))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                    /// Filter Button
                    Button {
                    } label: {
                        Image("filter")
                    }
                }
                .padding([.trailing,.leading], 18)
                
                /// Search View
                HStack(alignment: .center, content: {
                    Image(systemName: "magnifyingglass").foregroundColor(.gray)
                    TextField("検索", text:$searchText, onCommit: {
                          
                        })
                        .submitLabel(.search)
                        .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
                        .disableAutocorrection(true)
                    })
                .padding(10)
                .background(Color.secondary.opacity(0.2))
                .cornerRadius(18)
                .padding([.trailing,.leading], 18)
                
                /// Scroll View
                ScrollView {
                    
                    ForEach(arrUserList) { userDetail in
                        HStack{
                            Image("user")
                            Text(userDetail.name)
                            .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
                            .foregroundColor(.primary.opacity(0.6))
                        }
                        .onTapGesture(perform: {
                            pushedToUserDetail = true
                        })
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding([.trailing,.leading,.top],20)
                    }
                }
                NavigationLink(destination: UserDetailView(), isActive: $pushedToUserDetail){EmptyView()}
            }
            .padding([.top],20)
        })
        .navigationBarBackButtonHidden()
        .onAppear {
           
            guard arrUserList.count == 0 else {
                return
            }
            UserListAPIManager.sharedInstance.callWebServiceToGetUserList { arrUserData, success in
                guard success else {
                    return
                }
                for Index in (0 ..< arrUserData!.count) {
                    modelContext.insert(arrUserData![Index])
                }
            }
        }
    }
}

#Preview {
    UserListView()
}
