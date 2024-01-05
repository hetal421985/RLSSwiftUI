//
//  PowerPlantList.swift
//  RLSSwiftUI
//
//  Created by Hetal Mehta on 27/12/23.
//

import SwiftUI
import SwiftData

struct PowerPlantList: View {
  
    /// Model Context View
    @Environment(\.modelContext) private var modelContext
    
    /// Power Plant List
    @Query(sort: \PowerPlantListModel.id) var arrPowerPlantList: [PowerPlantListModel]

    /// Serach Text
    @State private var searchText: String = ""
    
    /// Push To User List
    @State private var pushToUserList = false
    
    var body: some View {
     
        VStack {
            Spacer()
                .frame(height: Constant.SpaceHeight.kMinimumSpaceHeight)
            Text("企業一覧")
            .padding([.top,.trailing,.leading], 15)
            .font(.custom(Constant.Font.kMedium, size: Constant.Font.kSize))
            .foregroundColor(.primary.opacity(0.8))
            .frame(maxWidth: .infinity, alignment: .leading)
        
            /// Custom Search Bar
            HStack(alignment: .center, content: {
                Image(systemName: "magnifyingglass").foregroundColor(.gray)
                TextField("検索", text: $searchText, onCommit: {
                        
                   /* guard !searchText.isEmpty else {
                        powerPlantListApiManager.arrPowerPlantList = powerPlantListApiManager.arrSearchPowerPlantList
                        return
                    }
                    powerPlantListApiManager.arrPowerPlantList =    powerPlantListApiManager.arrSearchPowerPlantList.filter { powerPlantDetail in
                        powerPlantDetail.data.contains(where: { $0.name == searchText})
                        }*/
                    })
                    .submitLabel(.search)
                    .font(.custom(Constant.Font.kRegular, size: Constant.Font.kRegularSize))
                    .disableAutocorrection(true)
                })
                .padding(7)
                .background(Color.secondary.opacity(0.2))
                .cornerRadius(15)
                .padding([.trailing,.leading], 15)
                ScrollView {
                
                    ForEach(0..<arrPowerPlantList.count, id: \.self) { Index in
                   
                        let aDictPowerPlant = arrPowerPlantList[Index]
                        PowerPlantHeader(powerPlantName: aDictPowerPlant, shouldExpand: .constant(aDictPowerPlant.expanded))
                            .onTapGesture {
                               arrPowerPlantList[Index].expanded.toggle()
                            }
                            .padding()
                        if aDictPowerPlant.expanded {
                            ForEach(aDictPowerPlant.data) { data in
                                PowerPlantDetail(powerPlantName: data)
                                    .padding()
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                    .onTapGesture {
                                        pushToUserList = true
                                    }
                            }
                        }
                    }
                }
               
            NavigationLink(destination: UserListView(), isActive: $pushToUserList){EmptyView()}
            
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            addPowerPlantListToSwiftData()
        }
    }
    /*
     This Function is used to fetch power plant list data from API
     */
    fileprivate func addPowerPlantListToSwiftData() {
        
        guard arrPowerPlantList.count == 0 else {
            return
        }
        PowerPlantListAPIManager.sharedInstance.callWebServiceToGetPowerPlantList { arrData, success in
            
            guard success else {
                return
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                
                for Index in (0 ..< arrData!.count) {
                    
                    let powerPlantListModel = PowerPlantListModel(id:  arrData![Index].id, title:  arrData![Index].title, expanded:  arrData![Index].expanded)
                    var arrPowerPlantName = [PowerPlantName]()
                    for powerPlantIndex in (0 ..< arrData![Index].data.count) {
                        arrPowerPlantName.append(PowerPlantName(id: arrData![Index].data[powerPlantIndex].id, name: arrData![Index].data[powerPlantIndex].name))
                    }
                    powerPlantListModel.data = arrPowerPlantName
                    modelContext.insert(powerPlantListModel)
                }
                
                /*do {
                    try modelContext.save()
                    arrPowerPlantList = try modelContext.fetch(FetchDescriptor<PowerPlantListModel>(sortBy: [SortDescriptor(\.id)]))
                    
                } catch {}*/
            }
        }
    }
}
    
#Preview {
    PowerPlantList()
}


