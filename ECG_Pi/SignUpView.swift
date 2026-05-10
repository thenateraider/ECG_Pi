import SwiftUI


struct SignUpView: View {
    @Environment(\.dismiss) var dismiss

    @State private var name = ""
    @State private var email = ""
    @State private var customGender: String = ""
    @State private var birthDate = Date()
    @State private var height = ""
    @State private var weight = ""
    @State private var selectedUnit: UnitSystem = .metric
    @State private var selectedGender: GenderOption? = nil
    var userProfile: UserProfileModel {
        UserProfileModel(
            name: name,
            email: email,
            gender: selectedGender == .other ? customGender : selectedGender?.rawValue ?? "",
            birthDate: birthDate,
            height: height,
            weight: weight,
            unit: selectedUnit
        )
    }
    var body: some View {
            ZStack(alignment: .top) {
                Color.white.ignoresSafeArea()

                VStack(spacing: 0) {
                    // ✅ Top Fixed Header
                    HStack {
                        Button(action: { dismiss() }) {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.red)
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)

                    HStack {
                        Text("Profile")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 4)

                    // ✅ Scrollable content
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 16) {
                            Group {
                                inputField(title: "Name", text: $name)
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Gender")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)

                                    HStack(spacing: 10) {
                                        ForEach(GenderOption.allCases) { option in
                                            Button(action: {
                                                withAnimation(.spring()) {
                                                    selectedGender = option
                                                }
                                            }) {
                                                ZStack {
                                                    if selectedGender == option {
                                                        Text(option.rawValue)
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                            .padding()
                                                            .frame(minWidth: 0, maxWidth: .infinity)
                                                            .background(option.backgroundColor)
                                                            .cornerRadius(12)
                                                            .scaleEffect(1.05)
                                                    } else {
                                                        Text(option.emoji)
                                                            .font(.largeTitle)
                                                            .frame(width: 60, height: 60)
                                                            .background(Color.gray.opacity(0.1))
                                                            .cornerRadius(12)
                                                    }
                                                }
                                            }
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                    }
                                }

                                if selectedGender == .other {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Please specify (optional)")
                                            .font(.subheadline)
                                            .foregroundColor(.gray)

                                        TextField("Your gender identity", text: $customGender)
                                            .padding()
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                            )
                                    }
                                }

                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Date of Birth")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)

                                    DatePicker("",
                                               selection: $birthDate,
                                               displayedComponents: [.date])
                                        .datePickerStyle(.wheel)
                                        .labelsHidden()
                                        .frame(maxWidth: .infinity)
                                        .clipped()
                                        .padding(.vertical, 6)
                                        .padding(.horizontal)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                        )
                                }

                                HStack(spacing: 16) {
                                    inputFieldWithSuffix(title: "Height", text: $height, suffix: heightUnit)
                                    inputFieldWithSuffix(title: "Weight", text: $weight, suffix: weightUnit)
                                }

                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Unit")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)

                                    Picker("Unit", selection: $selectedUnit) {
                                        ForEach(UnitSystem.allCases) { unit in
                                            Text(unit.rawValue).tag(unit)
                                        }
                                    }
                                    .pickerStyle(SegmentedPickerStyle())
                                }
                                .padding(.top, 8)
                            }
                            
                            Spacer(minLength: 40)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 80) // Space for Next button
                    }

                    Spacer()
                }

                // ✅ Bottom Fixed Button
                VStack {
                    Spacer()
                    NavigationLink(destination: AccountCredentialView(profile: userProfile)) {
                        Text("Next")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    


    func inputField(title: String, text: Binding<String>, keyboard: UIKeyboardType = .default) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)

            TextField("", text: text)
                .keyboardType(keyboard)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
    }

    func inputFieldWithSuffix(title: String, text: Binding<String>, suffix: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack {
                TextField("", text: text)
                    .keyboardType(.decimalPad)

                Text(suffix)
                    .foregroundColor(.gray)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )
        }
    }

    var heightUnit: String {
        selectedUnit == .metric ? "cm" : "ft"
    }

    var weightUnit: String {
        selectedUnit == .metric ? "kg" : "lb"
    }
}

enum UnitSystem: String, CaseIterable, Identifiable {
    case metric = "Metric (kg, cm)"
    case us = "US (lb, ft)"

    var id: String { self.rawValue }
}
