import SwiftUI

struct VideoListItemView: View {
    let video: Video

    var body: some View {
        HStack {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(8)

                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)

                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
        }
    }
}

struct VideoListItemView_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.toModel("videos.json")

    static var previews: some View {
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
