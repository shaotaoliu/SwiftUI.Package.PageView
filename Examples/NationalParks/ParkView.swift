import SwiftUI

struct ParkView: View {
    
    var park: Park

    var body: some View {
        Image(park.imageName)
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay(gradient)
    }
    
    var gradient: LinearGradient {
        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.8), Color.black.opacity(0)]),
                       startPoint: .bottom,
                       endPoint: .center)
    }
}

struct ParkView_Previews: PreviewProvider {
    static var previews: some View {
        ParkView(park: ParkViewModel().parks[0])
    }
}
