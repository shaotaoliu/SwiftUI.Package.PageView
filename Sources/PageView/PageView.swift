import SwiftUI

public struct PageView<Page: View>: View {
    
    public var pages: [Page]
    @Binding public var currentPage: Int
    
    public init(pages: [Page], currentPage: Binding<Int>) {
        self.pages = pages
        self._currentPage = currentPage
    }

    public var body: some View {
        ZStack(alignment: .bottomTrailing) {
            PageViewController(pages: pages, currentPage: $currentPage)
            
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}
