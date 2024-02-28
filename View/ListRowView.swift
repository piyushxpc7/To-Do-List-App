
import SwiftUI
struct ListRowView: View{
    
    
    let item: ItemModel
    var body: some View
    {
        
        HStack {
            Image (systemName: item.iscompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.iscompleted ?
                    .green : .red)
            Text(item.title)
            
            Spacer ()
            
        }
        .font(.title2)
        .padding(.vertical)
    }
}
struct ListRowView_Previews: PreviewProvider {
    static var item1 = ItemModel(title:"1st", isCompleted: false)
    static var item2 = ItemModel(title: "2nd", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
            
        }
        .previewLayout(.sizeThatFits)
    }
}
