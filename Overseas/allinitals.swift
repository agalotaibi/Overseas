//
//  allinitals.swift
//  Overseas
//
//  Created by Amaal on 13/08/1444 AH.
//

import Foundation
import SwiftUI
import CloudKit

struct Emergency: Identifiable{
    let record: CKRecord
    let Country: String
    let Ambulance: Int
    let Fire: Int
    let Police: Int
    let Image2: CKAsset?
    
    let id: CKRecord.ID
    
    init(record: CKRecord){
        self.record = record
        self.id = record.recordID
        self.Country = record["Country"] as? String ?? ""
        self.Ambulance = record["Ambulance"] as? Int ?? 0
        self.Fire = record["Fire"] as? Int ?? 0
        self.Police = record["Police"] as? Int ?? 0
        self.Image2 = record["Image"] as? CKAsset
        
    }
    
    
    
    
}




struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 29))
            .clipShape(Circle())
            .padding(.leading, 290.0)
            .padding(.bottom, 700)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.5), value: configuration.isPressed)
    }
}
//------------------------------------------ custom color
struct CustomColor {
    // static let Text = Color("Text")
    // Add more here...
}


struct Numb: Identifiable{
    let record: CKRecord
    let Ambulance: Int
    let Country: String
    let Fire: Int
    let Police: Int
    let Image2: CKAsset?
    let id: CKRecord.ID
    
    
    init(record: CKRecord){
        self.record = record
        self.id = record.recordID
        self.Ambulance = record["Ambulance"] as? Int ?? 0
        self.Country = record["Country"] as? String ?? ""
        self.Fire = record["Fire"] as? Int ?? 0
        self.Image2 = record["Image"] as? CKAsset
        self.Police = record["Police"] as? Int ?? 0
        
        
    }
    
    
    var bannerImage : Image{
        guard let fileURL = Image2?.fileURL else {return Image("earth")}
        let data = try! Data(contentsOf: fileURL)
        guard let uiImage = UIImage(data: data) else { return Image("earth") }
        let image = Image(uiImage: uiImage)
        return image
//        Image(uiImage: UIImage(named: "earth")!)

    }
}

struct Numb2: Identifiable{
    let record: CKRecord
    let Image2: CKAsset?
    let Country: String
    let id: CKRecord.ID
    
    
    init(record: CKRecord){
        self.record = record
        self.id = record.recordID
        self.Country = record["Country"] as? String ?? ""
        self.Image2 = record["Image"] as? CKAsset
        
    }
    
    
    var bannerImage2 : Image {
        guard let fileURL = Image2?.fileURL else {return Image("earth")}
        let data = try! Data(contentsOf: fileURL)
        guard let uiImage = UIImage(data: data) else { return Image("earth") }
        let image = Image(uiImage: uiImage)
        return image

    }
}




struct Emb: Identifiable{
    let record: CKRecord
    let Consulate_no: String
    let Country: String
    let Embasy_n: String
    let Nationality: String
    let id: CKRecord.ID

    init(record: CKRecord){
        self.record = record
        self.id = record.recordID
        self.Consulate_no = record["Consulate_no"] as? String ?? ""
        self.Country = record["Country"] as? String ?? ""
        self.Embasy_n = record["Embasy_n"] as? String ?? ""
        self.Nationality = record["Nationality"] as? String ?? ""
        

    }



}


extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ city: String?, _ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.locality, $0?.first?.country, $1) }
    }
}
