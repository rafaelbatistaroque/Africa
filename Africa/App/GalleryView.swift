import SwiftUI

struct GalleryView: View {

    @State private var selectedAnimal: String = "lion"
    @State private var gridColumn: Double = 3.0

    let animals: [Animal] = Bundle.main.toModel("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    var gridLayout: [GridItem] {
        Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))

                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding(.horizontal)

                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                    }
                }
                .animation(.easeIn, value: UUID())
            }
            .padding(.horizontal, 10)
            .padding(.vertical,50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
