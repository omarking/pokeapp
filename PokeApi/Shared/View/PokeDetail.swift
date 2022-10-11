
import SwiftUI
import Kingfisher

struct PokeDetail: View {
    let pokemonData : PokeData
    let pokemonViewModel: PokeViewModel
    
    init(pokemonData: PokeData, pokemonViewModel: PokeViewModel) {
        self.pokemonData = pokemonData
        self.pokemonViewModel = pokemonViewModel
    }
    
    var body: some View {
        ZStack{
            VStack{
                KFImage(URL(string: pokemonData.imageUrl))
                    .resizable()
                    .offset(y: 25)
                    .frame(width: 150, height: 150)
                    .zIndex(1)
                VStack(alignment: .leading){
                    /* Description section */
                    VStack(spacing: 15){
                        Text("#" + String(pokemonData.id))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            .padding(.top, 20)
                        Text(pokemonData.name.capitalized)
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        Text(pokemonData.type.uppercased())
                            .font(.title2).bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 15)
                            .frame(width: 150, height: 40)
                            .cornerRadius(20)
                        HStack(spacing: 20){
                            VStack{
                                HStack(alignment:.center, spacing: 5){
                                    Text(String(pokemonData.height/10))
                                        .font(.title)
                                    Text("KG")
                                        .font(.subheadline)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.gray)
                                }
                                Text("Height")
                                    .font(.subheadline)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.gray)
                            }
                            
                            VStack{
                                HStack(alignment:.center, spacing: 5){
                                    Text(String(pokemonData.weight/10))
                                        .font(.title)
                                    Text("METER")
                                        .font(.subheadline)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.gray)

                                }
                                
                                Text("Weight")
                                    .font(.subheadline)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(Color.gray)
                            }

                        }
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        
                        Text(pokemonData.description)
                            .foregroundColor(Color(.gray)).bold()
                            .padding(.horizontal, 15)
                    }
                    .padding(.top, 10)
                    
                    /* Stats Section */
                    VStack(alignment: .leading){
                        HStack{
                            Text("STATS")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.top, 10)
                                .padding(.horizontal, 20)
                        }
                        VStack(spacing: 5){
                            ForEach (0..<2) { i in
                                if( i == 0){
                                    StatList(statusName: "atk", value: pokemonData.attack/100)
                                }
                                else{
                                    StatList(statusName: "def", value: pokemonData.defense/100)
                                }
                            }
                        }
                        
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white)
                .cornerRadius(50.0, corners: [.topLeft, .topRight])
                    .edgesIgnoringSafeArea(.bottom)
                    
            }
        }
    }
}

// stats list view struct
struct StatList : View {
    @State var statusName : String
    @State var value : Float
    //@State var color : Color
    var body: some View {
        HStack {
            Text(statusName.uppercased())
                .font(.subheadline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.gray)
            .padding(.horizontal, 20)
         Text(String(Int(value*100)))
        }
        .padding(.horizontal, 10)
    }
}

// stats meterbar struct
struct Meterbar : View {
    @Binding var value : Float
    @Binding var color : Color
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading){
                // meterbar placeholder
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(.systemGray))
                
                // meterbar fill
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(color)
                    .animation(.linear)
                    .cornerRadius(45, corners: .allCorners)
            }
            .cornerRadius(45.0, corners: .allCorners)
        }
    }
}


// for top border corner radius
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
