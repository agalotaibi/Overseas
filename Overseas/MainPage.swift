//
//  MainPage.swift
//  Overseas
//
//  Created by Amaal on 10/07/1444 AH.
//

import SwiftUI

struct MainPage: View {
    let numberString = "111-222-3334" //change
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            //--------------------------------------- Title
            VStack {
                Text("France")
                Divider()
            }
            .foregroundColor(Color.white)
            .bold()
            .padding(.top, -325.0)
            .font(.largeTitle)
            .listRowBackground(Color.white)
            //--------------------------------------- List start
            VStack{
                List{
                    //---------------------------------------------------- police
                    HStack{
                        Image("police")
                            .font(.system(size: 29))
                        VStack {
                            Text("Police")
                            Text("999")
                                .foregroundColor(Color.gray)
                                .font(.footnote)
                                .padding(.leading, -30)
                        }
                        Button(
                            action: {
                                let telephone = "tel://"
                                let formattedString = telephone + numberString
                                guard let url = URL(string: formattedString) else { return }
                                UIApplication.shared.open(url)
                            },
                            label: {
                                Image("call")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50.0,height:50)
                                    .padding(.leading, 155)
                            })
                    }
                    //---------------------------------------------------- ambulance
                    HStack{
                        Image("ambulance")
                            .font(.system(size: 29))
                        VStack {
                            Text("Ambulance")
                            Text("999")
                                .foregroundColor(Color.gray)
                                .font(.footnote)
                                .padding(.leading, -50)
                        }
                        Button(
                            action: {
                                let telephone = "tel://"
                                let formattedString = telephone + numberString
                                guard let url = URL(string: formattedString) else { return }
                                UIApplication.shared.open(url)
                            },
                            label: {
                                Image("call")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50.0,height:50)
                                    .padding(.leading, 110)
                            })
                    }
                    //---------------------------------------------------- FireStation
                    HStack{
                        Image("fire")
                            .font(.system(size: 29))
                        VStack {
                            Text("Fire Station")
                            Text("990")
                                .foregroundColor(Color.gray)
                                .font(.footnote)
                                .padding(.leading, -50)
                        }
                        Button(
                            action: {
                                let telephone = "tel://"
                                let formattedString = telephone + numberString
                                guard let url = URL(string: formattedString) else { return }
                                UIApplication.shared.open(url)
                            },
                            label: {
                                Image("call")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50.0,height:50)
                                    .padding(.leading, 110)
                            })
                    }
                    //--------------------------------------- First list style
                }
                .scrollContentBackground(.hidden)
                .padding(.top, 150.0)
                .opacity(0.7)
                .foregroundColor(Color.black)
                .font(.system(size: 21))
            }
            //--------------------------------------- End of fist list. Second list start
            VStack{
                List{
                    //---------------------------------------------------- embaccy
                    HStack{
                        Image("saudi")
                            .font(.system(size: 29))
                        VStack {
                            Text("Embassy")
                            Text("+665-495-3467")
                                .foregroundColor(Color.gray)
                                .font(.footnote)
                                .padding(.trailing, -30)
                        }
                        Button(
                            action: {
                                let telephone = "tel://"
                                let formattedString = telephone + numberString
                                guard let url = URL(string: formattedString) else { return }
                                UIApplication.shared.open(url)
                            },
                            label: {
                                Image("call")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50.0,height:50)
                                    .padding(.leading, 130)
                            })
                    }
                    //---------------------------------------------------- embaccy
                    HStack{
                        Image("saudi")
                            .font(.system(size: 29))
                        VStack {
                            Text("Consulent")
                            Text("+665-374-3785")
                                .foregroundColor(Color.gray)
                                .font(.footnote)
                                .padding(.trailing, -30)
                        }
                        Button(
                            action: {
                                let telephone = "tel://"
                                let formattedString = telephone + numberString
                                guard let url = URL(string: formattedString) else { return }
                                UIApplication.shared.open(url)
                            },
                            label: {
                                Image("call")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50.0,height:50)
                                    .padding(.leading, 120)
                            })
                    }
                    //--------------------------------------- Second list style
                }
                .scrollContentBackground(.hidden)
                .padding(.top, 430.0)
                .opacity(0.7)
                .foregroundColor(Color.black)
                .font(.system(size: 19))
            }
            //---------------------------------------------------- Second list done
            VStack{
                Button(){
                }label: {
                    Image(systemName: "plus")
                        .background(Color.white)
                }
                .buttonStyle(GrowingButton())
            }
        }
    }
}
struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 40))
            .background(Color.gray)
            .clipShape(Circle())
            .padding(.leading, 290.0)
            .padding(.top, 700)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
//------------------------------------------ custom color
struct CustomColor {
    // static let Text = Color("Text")
    // Add more here...
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
