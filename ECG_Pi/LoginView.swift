import SwiftUI

enum LoginMode: String, CaseIterable, Identifiable {
    case email = "E-Mail"
    case phone = "Phone Number"
    
    var id: String { self.rawValue }
}

struct LoginView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    @State private var selectedCountry: CountryCode = CountryCode(flag: "🇹🇭", code: "+66", name: "Thailand")
    @State private var loginMode: LoginMode = .email
    @State private var emailOrPhone: String = ""
    @State private var password: String = ""
    @State private var showSignUp = false
    @State private var errorText: String = ""
    @State private var showGuest = false
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                
                Image("RedIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 240, height: 240)
                    .padding(.top, 40)

                VStack(spacing: 6) {
                    Text("Login")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Text("Please sign in to continue.")
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)

                Picker("Login With", selection: $loginMode) {
                    ForEach(LoginMode.allCases) { mode in
                        Text(mode.rawValue).tag(mode)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)

                Group {
                    if loginMode == .phone {
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
                    }  else {
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

                    HStack {
                        Image(systemName: "lock")
                            .foregroundColor(.gray)
                        SecureField("Password", text: $password)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }

                if !errorText.isEmpty {
                    Text(errorText)
                        .foregroundColor(.red)
                        .font(.caption)
                        .padding(.horizontal)
                }

                HStack(spacing: 20) {
                    Button("Sign Up") {
                        showSignUp = true
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)

                    Button(action: {
                        if emailOrPhone.isEmpty || password.isEmpty {
                            errorText = "Please fill in all fields."
                        } else {
                            isLoggedIn = true
                        }
                    }) {
                        Text("LOG IN")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(gradient: Gradient(colors: [Color.red.opacity(0.8), Color.red]),
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                            )
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }
                .padding(.horizontal)

                Spacer()

                HStack {
                    Text("Don’t have an account?")
                        .foregroundColor(.gray)
                    Button("Guest sign in") {
                        showGuest = true
                    }
                    .foregroundColor(.red)
                    .underline()
                }
                .font(.footnote)
                .padding(.bottom, 24)

                NavigationLink(destination: SignUpView(), isActive: $showSignUp) {
                    EmptyView()
                }
                NavigationLink(destination: GuestRegistrationView(), isActive: $showGuest) {
                    EmptyView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}
