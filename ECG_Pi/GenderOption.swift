import SwiftUI

enum GenderOption: String, CaseIterable, Identifiable {
    case male = "Male"
    case female = "Female"
    case unspecified = "Rather not say"
    case other = "Other"

    var id: String { self.rawValue }

    var emoji: String {
        switch self {
        case .male: return "🙋🏻‍♂️"
        case .female: return "🙋🏻‍♀️"
        case .unspecified: return "🙅🏻"
        case .other: return "📝"
        }
    }

    var backgroundColor: Color {
        switch self {
        case .male: return .cyan
        case .female: return .pink
        case .unspecified, .other: return .red
        }
    }
}

struct InteractiveGenderPicker: View {
    @Binding var selectedGender: GenderOption?

    var body: some View {
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
}
