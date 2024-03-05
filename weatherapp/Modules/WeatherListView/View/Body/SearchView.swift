import SwiftUI

struct SearchView: View {
    @Binding var text: String
    
    var body: some View {
        ZStack{
            Color.gray
                .opacity(0.5)
            HStack{
                Image(systemName: "magnifyingglass")
                TextField("Search for a city", text: $text)
                Spacer()
            }
            .padding([.leading, .trailing])
        }
        .frame(height: 40)
        .cornerRadius(10)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant("Search for a city"))
    }
}
