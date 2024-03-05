import SwiftUI

struct HeaderIconView: View {
    var clicked: (() -> Void)
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Button(action: clicked) {
                    Image(systemName: "map")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                }
            }
            .padding([.leading, .trailing])
        }
        .frame(height: 20)
        .cornerRadius(10)
    }
}

struct HeaderIconView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderIconView(clicked: {})
    }
}
