import SwiftUI
import PageView

struct ContentView: View {
    
    @State private var vm = ParkViewModel()
    @State private var currentPage = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Text(vm.parks[currentPage].name)
                    .font(.system(size: 20))
                    .bold()
                
                PageView(pages: vm.parks.map {
                    ParkView(park: $0)
                }, currentPage: $currentPage)
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ScrollView {
                    Text(vm.parks[currentPage].description)
                        .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
