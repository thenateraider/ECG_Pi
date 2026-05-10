//
//  AccountCredentialView.swift
//  ECG_Pi
//
//  Created by NATEz Ekkaluck on 3/29/25.
//


import SwiftUI
struct CountryCode: Identifiable {
    let id = UUID()
    let flag: String
    let code: String
    let name: String

    var display: String {
        "\(flag) \(code) \(name)"
    }
}

let countryCodes: [CountryCode] = [
    .init(flag: "🇺🇸", code: "+1", name: "United States"),
    .init(flag: "🇬🇧", code: "+44", name: "United Kingdom"),
    .init(flag: "🇯🇵", code: "+81", name: "Japan"),
    .init(flag: "🇹🇭", code: "+66", name: "Thailand"),
    .init(flag: "🇫🇷", code: "+33", name: "France"),
    .init(flag: "🇩🇪", code: "+49", name: "Germany"),
    //  เพิ่มประเทศอื่นได้อีกตามต้องการ
].sorted { $0.name < $1.name }

struct AccountCredentialView: View {
    var profile: UserProfileModel

    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @State private var selectedCountry: CountryCode = CountryCode(flag: "🇹🇭", code: "+66", name: "Thailand")
    @State private var mode: LoginMode = .email
    @State private var emailOrPhone = ""
    @State private var password = ""
    @State private var errorText = ""

    var body: some View {
        VStack(spacing: 24) {
            Text("Create Account")
                .font(.largeTitle)
                .fontWeight(.bold)

            Picker("Method", selection: $mode) {
                ForEach(LoginMode.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            if mode == .phone {
                HStack(spacing: 8) {
                    Menu {
                        ForEach(countryCodes) { country in
                            Button(country.display) {
                                selectedCountry = country
                            }
                        }
                    } label: {
                        HStack {

                            Text(selectedCountry.code)
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }

                    HStack {
                        Image(systemName: "phone")
                            .foregroundColor(.gray)
                        TextField("Phone Number", text: $emailOrPhone)
                            .keyboardType(.phonePad)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                }
                .padding(.horizontal)
            } else {
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    TextField("E-Mail", text: $emailOrPhone)
                        .keyboardType(.emailAddress)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                .padding(.horizontal)
            }

            //  Password Field
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                SecureField("Password", text: $password)
            }
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(12)
            .padding(.horizontal)
            if !errorText.isEmpty {
                Text(errorText)
                    .foregroundColor(.red)
                    .font(.caption)
            }

            Button("Create Account") {
                guard !emailOrPhone.isEmpty, !password.isEmpty else {
                    errorText = "Please fill in all fields."
                    return
                }

                errorText = ""
                //  Firebase Auth + Firestore จะมาใส่ตรงนี้ภายหลัง
                let fullPhoneOrEmail = mode == .phone ? selectedCountry.code + emailOrPhone : emailOrPhone
                print(" Creating account for: \(profile.name), \(fullPhoneOrEmail)")
                isLoggedIn = true
            }
            .fontWeight(.bold)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(15)

            Spacer()
        }
        .padding()
    }
}

