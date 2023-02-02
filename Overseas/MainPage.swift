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
        NavigationView {
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
                                    Image(systemName: "phone.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40.0)
                                        .padding(.leading, 165)
                                        .foregroundColor(Color.green)
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
                                    Image(systemName: "phone.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40.0)
                                        .padding(.leading, 120)
                                        .foregroundColor(Color.green)
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
                                    Image(systemName: "phone.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40.0)
                                        .padding(.leading, 120)
                                        .foregroundColor(Color.green)
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
                                    Image(systemName: "phone.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40.0)
                                        .padding(.leading, 140)
                                        .foregroundColor(Color.green)
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
                                    .padding(.trailing, -15)
                            }
                            Button(
                                action: {
                                    let telephone = "tel://"
                                    let formattedString = telephone + numberString
                                    guard let url = URL(string: formattedString) else { return }
                                    UIApplication.shared.open(url)
                                },
                                label: {
                                    Image(systemName: "phone.circle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40.0)
                                        .padding(.leading, 130)
                                        .foregroundColor(Color.green)
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
                    NavigationLink(destination: addCity(),
                                   label: {
                        Image(systemName: "plus")
                            .background(Color.gray)
                            .foregroundColor(Color.black)
                    })
                    .buttonStyle(GrowingButton())
                }
            } .preferredColorScheme(.light)
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
            .padding(.top, 720)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.5), value: configuration.isPressed)
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
