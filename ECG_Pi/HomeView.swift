//
//  HomeView.swift
//  ECG_Pi
//
//  Created by NATEz Ekkaluck on 3/30/25.
//

import SwiftUI
import FirebaseFirestore

let selectedDeviceID = UserDefaults.standard.string(forKey: "selectedDeviceID") ?? "ECGCARDIA1"

struct AbnormalitiesInfoSheetView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            ScrollView {
                Text("""
                     CARDIA helps monitor your heart by detecting ECG abnormalities. It’s important to know how to interpret these results and take the right steps to manage your health.\nNormal vs. Abnormal Results\nA normal ECG suggests your heart is functioning well. If you receive an abnormal result, it’s not always a cause for alarm. Many irregularities are harmless and can be caused by factors like stress or caffeine. If you feel fine, retest later and observe the consistency. If the issue persists, consider consulting a doctor.\nImmediate Medical Attention\nSome ECG abnormalities signal serious conditions, such as atrial fibrillation or signs of a heart attack, which require urgent care. If you experience symptoms like chest pain, shortness of breath, or dizziness alongside an abnormal result, seek immediate medical attention. Even without symptoms, consult a doctor promptly if serious irregularities are detected.\nManaging Mild Abnormalities\nMild issues like premature atrial contractions or bradycardia often don’t need immediate treatment, especially if you're symptom-free. Track your ECG results over time and schedule a check-up if these irregularities are persistent. Lifestyle adjustments, like reducing caffeine, managing stress, and staying hydrated, can help.\nMonitoring and Follow-Up\nRegular ECG monitoring helps spot trends and catch early signs of potential problems. Save your results to share with your doctor, and monitor changes in your well-being after exercising, stressful periods, or when taking new medications. This consistent tracking will help guide your healthcare decisions.\nLifestyle Adjustments for Heart Health\nMany ECG abnormalities improve with heart-healthy lifestyle changes. Focus on a balanced diet, regular exercise, limiting stimulants like caffeine and alcohol, managing stress, and ensuring good sleep quality. These adjustments support overall heart health and may reduce irregularities.\nRoutine Check-Ups\nEven if your app detects only minor issues, routine check-ups are crucial to maintaining heart health. Consistent abnormalities, even without symptoms, should be reviewed by a healthcare provider. If you have a family history of heart disease or other risk factors, consider seeing a cardiologist for further evaluation.\nBy understanding your ECG readings and making informed decisions, you can stay proactive about your heart health. Use the app as a tool to stay informed, but always seek medical advice for a proper diagnosis and treatment.\n\n\n.‎‎‎‎‎‏‏‎‏‏‎ ‎
                     """)
                .font(.system(size: 18, weight: .light))
                .lineSpacing(8)
                .padding()
            }
            .navigationTitle("Abnormalities Info")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}
struct HRVInfoSheetView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            ScrollView {
                Text("""
                     What is Heart Rate Variability?\nHeart rate variability (HRV) is a relatively new metric that measures the variations between consecutive heartbeats. Unlike heart rate, which counts the number of heartbeats per minute, HRV assesses the differences in timing between each beat. This variation is influenced by your autonomic nervous system (ANS) and can be affected by stress, sleep, activities, and mood, offering insight into your health and fitness.\nFactors That Can Affect HRV\nMany factors can influence HRV, including stress, hormone levels, diet, physical activity, inflammation, mood conditions, asthma, heart disease, arrhythmias, diabetes, age, sleep disorders, and certain medications. While there are no specific guidelines for defining a "poor" HRV, monitoring these factors can provide valuable insights into your overall health.\nWhat is the ideal HRV?\nThere is no universal "ideal" HRV, as it varies based on individual health and personal goals. For example, athletes might aim for specific HRV targets to optimize performance. Generally, a higher HRV is considered better, indicating a more adaptable and resilient heart. Tracking HRV over time and comparing it to your baseline can help you identify significant changes, which should be discussed with a healthcare professional.\n\nSources:\nhttps://www.ncbi.nlm.nih.gov/pmc/articles/PMC5624990/\nhttps://www.thelancet.com/journals/landig/article/PIIS2589-7500%2820%2930246-6/fulltext\nhttps://www.heartmath.org/research/science-of-the-heart/heart-rate-variability/\n\n\n.‎‎‎‎‎‏‏‎‏‏‎ ‎
                     """)
                .font(.system(size: 18, weight: .light))
                .lineSpacing(8)
                .padding()
            }
            .navigationTitle("HRV Info")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}
struct HeartRateInfoSheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            ScrollView {
                Text("What’s a Normal Resting Heart Rate?\nUnderstanding your heart rate is essential for evaluating your heart health. Generally, a normal resting heart rate for adults ranges between 60 and 100 beats per minute (BPM). However, athletes may have a resting heart rate as low as 40 BPM, which is also considered normal. It’s important to note that factors such as age, activity level, and medications can influence your heart rate.\nFactors That Can Affect Heart Rate\nSeveral factors can affect your resting heart rate. Hot temperatures, pain, and emotions like anxiety or excitement can elevate it, while medications, such as beta-blockers, can lower it. Obesity and conditions like anemia, where the heart needs to work harder, can increase heart rate. Hormonal imbalances, like thyroid disorders, can also affect your resting heart rate. Additionally, smokers often have higher resting heart rates, which can improve after quitting smoking.\nWhat is a Dangerous Heart Rate?\nWhile occasional fluctuations in heart rate are normal, significant variations might require medical attention. A heart rate above 100 BPM is considered tachycardia for adults. Causes of tachycardia can include underlying health conditions, stress, heavy caffeine or alcohol consumption, drug use, intense physical activity, and fever.\nConversely, a heart rate below 60 BPM is termed bradycardia. Possible causes of bradycardia include medication side effects, electrolyte imbalances, obstructive sleep apnea, underlying health conditions, aging, and issues with the heart's conduction system. While borderline or occasional bradycardia might not need treatment, prolonged bradycardia can lead to dizziness and fainting if left untreated.\nWhen is it an Emergency?\nIt’s crucial to seek immediate medical attention if you notice a sudden change in your heartbeat accompanied by symptoms such as shortness of breath, chest tightness or pain, dizziness or lightheadedness, fainting, or an inability to exercise. These symptoms could indicate a serious heart complication that requires prompt evaluation by a healthcare professional.\n\nSources:\nhttps://www.heart.org/en/health-topics/high-blood-pressure/the-facts-about-high-blood-pressure/all-about-heart-rate-pulse\nhttps://www.heart.org/en/health-topics/arrhythmia/about-arrhythmia/tachycardia--fast-heart-rate\nhttps://www.heart.org/en/health-topics/arrhythmia/about-arrhythmia/bradycardia--slow-heart-rate\n\n\n.‎‎‎‎‎‏‏‎‏‏‎ ‎")

                .font(.system(size: 18, weight: .light))
                .lineSpacing(8)
                .padding()
            }
            .navigationTitle("Heart Rate Info")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}
struct HomeContentView: View {
    @Binding var showSidebar: Bool
    @State private var heartRate: Double = 0
    @State private var hrv: Double = 0
    @State private var miDetected: Bool = false
    @State private var timestamp: String = ""
    @State private var showHistorySheet = false
    @State private var showDeviceConnectionSheet = false
    @State private var showHeartRateInfoSheet = false
    @State private var showHRVInfoSheet = false
    @State private var showAbnormalitiesInfoSheet = false
    @State private var showDeviceSheet = false
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Latest Result")
                .font(.largeTitle)
                .bold()
            Text("Updated time: \(timestamp)")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 8)

            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    // Heart Rate
                    VStack(alignment: .leading, spacing: 4) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("Heart Rate")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        Text("\(Int(heartRate))")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Text("BPM")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        showHeartRateInfoSheet = true
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(20)

                    // HRV
                    VStack(alignment: .leading, spacing: 4) {
                        Image(systemName: "waveform.path.ecg")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("HRV")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        Text("\(Int(hrv))")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Text("ms.")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.white)
                    }.onTapGesture {
                        showHRVInfoSheet = true
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(20)
                }

                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.white)
                            .font(.title)
                        Text("Abnormalities")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                        Text(miDetected ? "1" : "0")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Text("events")
                            .font(.caption)
                            .bold()
                            .foregroundColor(.white)
                    }.onTapGesture {
                        showAbnormalitiesInfoSheet = true
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(20)
                }
            }
            .padding()
        .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color.white)
                    .shadow(color: .gray.opacity(0.1), radius: 2)
            )
        Button(action: {
            showHistorySheet = true
        }) {
            HStack {
                Image(systemName: "clock.arrow.circlepath")
                Text("View Result History")
                    .font(.headline)
                    
                    .bold()
            }
            .foregroundColor(.blue)
            .padding(.top, 16)
        }
        .sheet(isPresented: $showHistorySheet) {
            HistoryListView()
        }
        }.sheet(isPresented: $showHeartRateInfoSheet) {
            HeartRateInfoSheetView()
        }.sheet(isPresented: $showHRVInfoSheet) {
            HRVInfoSheetView()
        }
        .sheet(isPresented: $showAbnormalitiesInfoSheet) {
            AbnormalitiesInfoSheetView()
        }
        .padding(.horizontal) // ❗️ตรงนี้ให้ใช้แบบนี้ ไม่ต้องใส่ .horizontal, 0
        .onAppear {
            let db = Firestore.firestore()
            let deviceID = UserDefaults.standard.string(forKey: "selectedDeviceID") ?? "ECGCARDIA1"
            db.collection("Device").document(deviceID)
              .collection("LastUpdated").document("Summary")
              .addSnapshotListener { documentSnapshot, error in
                  guard let doc = documentSnapshot, doc.exists else { return }
                  let data = doc.data() ?? [:]
                  if let hr = data["HeartRate"] as? Double {
                      heartRate = hr
                  }
                  if let hrvValue = data["HRV"] as? Double {
                      hrv = hrvValue
                  }
                  if let mi = data["MI_Detected"] as? Bool {
                      miDetected = mi
                  }
                  if let ts = data["Timestamp"] as? Timestamp {
                      let dateFormatter = DateFormatter()
                      dateFormatter.dateStyle = .medium
                      dateFormatter.timeStyle = .short
                      timestamp = dateFormatter.string(from: ts.dateValue())
                  }
              }
        }
    }
}
struct MorphingMenuIcon: View {
    var isSidebarOpen: Bool
    var body: some View {
        ZStack {
            Image(systemName: "line.horizontal.3")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(Color.white)
                .opacity(isSidebarOpen ? 0 : 1)

            Image(systemName: "chevron.backward")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(Color.white)
                .opacity(isSidebarOpen ? 1 : 0)
        }
        .animation(.easeInOut(duration: 0.25), value: isSidebarOpen)
    }
}
struct HomeView: View {
    @State private var showSidebar = false
    @State private var selectedTab = 0

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
 
            // Tab Switching Content Area
            ZStack {
                ScrollView {
                    VStack(spacing: 0) {
                        Spacer().frame(height: 100) // push below Hamburger bar
                        switch selectedTab {
                        case 0:
                            HomeContentView(showSidebar: $showSidebar)
                                .padding(.horizontal,16)
                        case 1:
                            DiagnoseView()
                                .padding(.horizontal)
                        case 2:
                            EmergencyView()
                                .padding(.horizontal)
                        default:
                            EmptyView()
                        }
                    }
                    .padding(.bottom, 40)
                }
            }
 
            HStack {
                Button(action: { selectedTab = 0 }) {
                    VStack(spacing: 4) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 22))
                        Text("Home")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == 0 ? .red : .gray)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(
                        selectedTab == 0 ?
                        AnyView(RoundedRectangle(cornerRadius: 12).fill(Color.red.opacity(0.15))) :
                        AnyView(EmptyView())
                    )
                }
                Button(action: { selectedTab = 1 }) {
                    VStack(spacing: 4) {
                        Image(systemName: "heart")
                            .font(.system(size: 22))
                        Text("Diagnose")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == 1 ? .red : .gray)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(
                        selectedTab == 1 ?
                        AnyView(RoundedRectangle(cornerRadius: 12).fill(Color.red.opacity(0.15))) :
                        AnyView(EmptyView())
                    )
                }
                Button(action: { selectedTab = 2 }) {
                    VStack(spacing: 4) {
                        Image(systemName: "bell.and.waves.left.and.right")
                            .font(.system(size: 22))
                        Text("Emergency")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == 2 ? .red : .gray)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(
                        selectedTab == 2 ?
                        AnyView(RoundedRectangle(cornerRadius: 12).fill(Color.red.opacity(0.15))) :
                        AnyView(EmptyView())
                    )
                }
            }
            .padding(.top, 10)
            .padding(.bottom, 30)
            .background(Color.white)
            }
            
            // Overlay Top Bar pinned above all
            VStack {
                ZStack {
                    HStack {
                        Button(action: {
                            withAnimation {
                                showSidebar.toggle()
                            }
                        }) {
                            MorphingMenuIcon(isSidebarOpen: showSidebar)
                        }
                        Image("WhiteLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 55)
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(
                        ZStack(alignment: .bottom) {
                            Color.red.ignoresSafeArea(edges: .top)
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(Color.red)
                                .frame(height: 60)
                        }
                    )
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .zIndex(2)
            
            if showSidebar {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showSidebar = false
                        }
                    }

                VStack {
                    Spacer().frame(height: 70) // less spacing
                    SidebarView(showSidebar: $showSidebar)
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.white)
        .onAppear {
            updateLastLogin()
        }
    }
}

func updateLastLogin() {
    guard let name = UserDefaults.standard.string(forKey: "guestName") else { return }
    let db = Firestore.firestore()
    let docRef = db.collection("GuestUser").document(name).collection("LastLogin").document("timestamp")
    docRef.setData(["timestamp": Timestamp(date: Date())]) { error in
        if let error = error {
            print("❌ Failed to update last login: \(error.localizedDescription)")
        } else {
            print("✅ Last login timestamp updated for \(name)")
        }
    }
}

struct SummaryCard: View {
    let icon: String
    let color: Color
    let title: String
    let value: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .padding(10)
                .background(color)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.white)
                Text(value)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding()
        .background(color)
        .cornerRadius(12)
    }
}

struct SidebarView: View {
    @Binding var showSidebar: Bool
    @Environment(\.dismiss) var dismiss
    @State private var navigateToLogin = false
    @State private var showLegalSheet = false
    @State private var showHistorySheet = false
    @State private var showDeviceConnectionSheet = false // ✅ เพิ่มบรรทัดนี้
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 20) {
                
                let name = UserDefaults.standard.string(forKey: "guestName") ?? "Guest"
                let gender = UserDefaults.standard.string(forKey: "guestGender")
                let age = UserDefaults.standard.string(forKey: "guestAge")
                let height = UserDefaults.standard.string(forKey: "guestHeight")
                let weight = UserDefaults.standard.string(forKey: "guestWeight")
                
                VStack(alignment: .leading, spacing: 4) {
                    Spacer().frame(height: 60) // push below system UI
                    Text(name)
                        .font(.system(size: 36, weight: .bold))
                    Text("@Guest")
                        .font(.title3)
                        .foregroundColor(.gray)
                }
                
                
                Group {
                    if let gender = gender {
                        InfoRow(label: "Gender", value: gender)
                    }
                    if let age = age {
                        InfoRow(label: "Age", value: age)
                    }
                    if let height = height {
                        InfoRow(label: "Height", value: height)
                    }
                    if let weight = weight {
                        InfoRow(label: "Weight", value: weight)
                    }
                }
                
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 15) {
                    Button(action: {
                        showDeviceConnectionSheet = true
                    }) {
                        SidebarItem(icon: "antenna.radiowaves.left.and.right", label: "Device Connection")
                            .foregroundColor(.black)
                    }
                    .sheet(isPresented: $showDeviceConnectionSheet) {
                        DeviceConnectionSheetView()
                    }
                    Button(action: {
                        showHistorySheet = true
                    }) {
                        SidebarItem(icon: "clock.arrow.circlepath", label: "Result History")
                            .foregroundColor(.black)
                    }
                    .sheet(isPresented: $showHistorySheet) {
                        HistoryListView()
                    }
                    Button(action: {
                        showLegalSheet = true
                    }) {
                        SidebarItem(icon: "shield.lefthalf.fill", label: "Legal")
                            .foregroundColor(.black)
                    }
                    .sheet(isPresented: $showLegalSheet) {
                        LegalSheetView()
                    }
                }
                
                Button(action: {
                    UserDefaults.standard.removeObject(forKey: "guestName")
                    UserDefaults.standard.removeObject(forKey: "guestGender")
                    UserDefaults.standard.removeObject(forKey: "guestAge")
                    UserDefaults.standard.removeObject(forKey: "guestHeight")
                    UserDefaults.standard.removeObject(forKey: "guestWeight")
                    UserDefaults.standard.set(false, forKey: "isLoggedIn")
                    navigateToLogin = true
                }) {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Log Out")
                    }
                    .foregroundColor(.red)
                    .padding(.top)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.bottom, 40)
            .background(Color.white)
            .edgesIgnoringSafeArea(.vertical)
        }
        
        NavigationLink(destination: LoginView(), isActive: $navigateToLogin) {
            EmptyView()
        }
    }
}

struct InfoRow: View {
    let label: String
    let value: String

    var body: some View {
        HStack {
            Text(label + ":")
                .font(.headline)
                .bold()
            Spacer()
            Text(value)
                .font(.headline)
                .bold()
        }
    }
}

struct SidebarItem: View {
    let icon: String
    let label: String

    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(label)
        }
        .font(.headline)
        .bold()
    }
}

struct DiagnoseView: View {
    @State private var showHistorySheet = false
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Removed duplicate header as main view provides a pinned header.

            VStack(spacing: 16) {
                Button(action: {
                    showHistorySheet = true
                }) {
                    DiagnoseCard(title:"Result\nHistory", color: Color.orange.opacity(0.3), imageName: "clock")
                        .foregroundColor(.black)
                }
                .sheet(isPresented: $showHistorySheet) {
                    HistoryListView()
                }
            }

            Spacer()
        }
        .padding()
    }
}

struct EmergencyView: View {
    @State private var showCPRSheet = false
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Removed duplicate header as main view provides a pinned header.
                
                let name = UserDefaults.standard.string(forKey: "guestName") ?? "Guest"
                let isGuest = !UserDefaults.standard.bool(forKey: "isGuestRegistered")
                
                VStack(alignment: .leading, spacing: 10) {
                    HStack(alignment: .center) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .padding(.trailing, 10)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(name)
                                .font(.title)
                            
                            if !isGuest {
                                Text("@User101")
                                    .foregroundColor(.gray)
                                Text("Age: 44")
                                Text("Gender: Male")
                                Text("Date of Birth: 01/01/1980")
                                Text("Blood Type: AB+")
                                Text("National ID Number: 1100123456789")
                                Text("Emergency Contact: +66 901234567")
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                }

                Button(action: {
                    showCPRSheet = true
                }) {
                    HStack {
                        Text("Click for CPR Instructions")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "heart.text.square")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.red)
                    .cornerRadius(16)
                }
                .padding(.horizontal)

                VStack(spacing: 10) {
                    Button(action: {
                        if let url = URL(string: "https://aed4all.net") {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        VStack(spacing: 12) {
                            Image(systemName: "map.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
 
                            Text("Locate Nearby AED")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(16)
                    }
 
                    Text("Disclaimer: By clicking this button, you will be redirected to an external website that provides information on AED locations powered by AED4ALL.")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }
                .padding(.horizontal)
            }
            .padding()
            .sheet(isPresented: $showCPRSheet) {
                CPRInstructionsView()
            }
        }
    }
}




struct CPRInstructionsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentStep = 0
    @State private var iconOpacity = 1.0

    let steps: [(title: String, description: String)] = [
        ("Clear the Area", "Before engaging in any action, make sure that yourself, the victim, and the surroundings are safe from any harm."),
        ("Check for Consciousness", "Tap the shoulder of the victim and ask, “Are you alright?”."),
        ("Activate the EMS", "If the victim is not responsive, request a bystander to call for the emergency service immediately and describe the situation."),
        ("Give 30 Chest Compression", "Press hard and fast on the chest at 2 inches deep, at a rate of 100–120 compressions per minute."),
        ("Give 2 Rescue Breaths", "Gently pinch the victim’s nose and cover the mouth with your own. Breathe into the mouth twice."),
        ("Repeat the Cycle", "Continue giving chest compressions and rescue breaths until you see obvious signs of life or too exhausted to keep going."),
        ("Use an AED", "If available, turn on AED and attach to the victim. Stand clear and press the shock button when instructed by AED.")
    ]
    
    func iconForStep(_ index: Int) -> String {
        let icons = [
            "exclamationmark.triangle",       // Clear the Area
            "person.fill.questionmark",       // Check for Consciousness
            "phone.fill.arrow.up.right",      // Activate the EMS
            "waveform.path.ecg",              // Give 30 Chest Compression
            "lungs.fill",                     // Give 2 Rescue Breaths
            "repeat.circle.fill",             // Repeat the Cycle
            "bolt.heart.fill"                 // Use an AED
        ]
        return icons[index]
    }

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.red.opacity(0.7), Color.red],
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .font(.title)
                            .padding()
                    }
                }
                Spacer()
            }

            VStack {
                Spacer()

                Image(systemName: iconForStep(currentStep))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.white)
                    .opacity(iconOpacity)
                    .id(currentStep)

                Spacer()

                VStack {
                    Text(steps[currentStep].title)
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 5)
                    Text(steps[currentStep].description)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    HStack(spacing: 6) {
                        ForEach(0..<steps.count, id: \.self) { index in
                            Circle()
                                .fill(index == currentStep ? Color.red : Color.gray.opacity(0.4))
                                .frame(width: 8, height: 8)
                        }
                    }
                    .padding(.top)

                    HStack {
                        if currentStep > 0 {
                            Button(action: {
                                withAnimation(.easeOut(duration: 0.2)) {
                                    iconOpacity = 0
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    currentStep -= 1
                                    withAnimation(.easeIn(duration: 0.2)) {
                                        iconOpacity = 1
                                    }
                                }
                            }) {
                                Text("Back")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white)
                                    .foregroundColor(.red)
                                    .cornerRadius(12)
                            }
                        } else {
                            Spacer()
                        }
 
                        Button(action: {
                            if currentStep < steps.count - 1 {
                                withAnimation(.easeOut(duration: 0.2)) {
                                    iconOpacity = 0
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    currentStep += 1
                                    withAnimation(.easeIn(duration: 0.2)) {
                                        iconOpacity = 1
                                    }
                                }
                            } else {
                                dismiss()
                            }
                        }) {
                            Text(currentStep == steps.count - 1 ? "Finish" : "Next")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(24)
                .padding(.horizontal)
            }.gesture(
                DragGesture()
                    .onEnded { value in
                        if value.translation.width < -50 && currentStep < steps.count - 1 {
                            withAnimation(.easeOut(duration: 0.2)) {
                                iconOpacity = 0
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                currentStep += 1
                                withAnimation(.easeIn(duration: 0.2)) {
                                    iconOpacity = 1
                                }
                            }
                        } else if value.translation.width > 50 && currentStep > 0 {
                            withAnimation(.easeOut(duration: 0.2)) {
                                iconOpacity = 0
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                currentStep -= 1
                                withAnimation(.easeIn(duration: 0.2)) {
                                    iconOpacity = 1
                                }
                            }
                        }
                    }
            )
        }
    }
}

struct DiagnoseCard: View {
    let title: String
    let color: Color
    let imageName: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
            }
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
        }
        .padding()
        .background(color)
        .cornerRadius(16)
    }
}

struct HeaderView: View {
    let title: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "line.horizontal.3")
                Text("CARDIA")
                    .font(.title2)
                    .bold()
            }
            .foregroundColor(.white)

            if !title.isEmpty {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .cornerRadius(24)
    }
}

#Preview {
    HomeView()
}

struct LegalSheetView: View {
    @Environment(\.dismiss) var dismiss  // เพิ่มตัวแปรนี้

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Legal")
                        .font(Font.custom("", size: 46).weight(.bold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)

                    Text("""
Privacy Policy
Welcome to CARDICARE. Your privacy is important to us. If you choose to use our service, then you agree to the collection and use of information in relation to this policy.

Information Collection and Use
We understand the importance of protecting your personal information and are committed to safeguarding your privacy. The information we collect is solely used to enhance your experience using our mobile app, CARDIAC. This information includes your name, email address, and other information that you provide to us.

We do not share your personal information with any third-party services, except where required by law. We may use your personal information to send you updates, newsletters, or other marketing materials related to our app.

By using our app, you agree to the collection and use of your personal information as outlined in this privacy policy. If you do not agree with this policy, please do not use our app.

Links to Other Sites
This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, it is strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.

Changes to This Privacy Policy
The Privacy Policy may be update from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.

This policy is effective as of 23-06-2024.
""")
                        .font(Font.custom("Inter", size: 18).weight(.semibold))
                        .foregroundColor(.black)
                        .padding(.horizontal)
                }
                .padding()
            }
            .navigationBarItems(trailing:
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundColor(.gray)
                }
            )
        }
    }
}

struct DeviceConnectionSheetView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("selectedDeviceID") private var storedDeviceID: String = ""
    @State private var deviceID = UserDefaults.standard.string(forKey: "selectedDeviceID") ?? ""
    @State private var deviceStatus: String?
    @State private var lastOnline: String?
    @State private var errorMessage: String?

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Enter Device ID")
                    .font(.title2)
                    .bold()
                if let status = deviceStatus, let last = lastOnline {
                    Text(deviceID)
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.horizontal)
                } else {
                    TextField("Device ID (e.g. ECGCARDIA1)", text: $deviceID)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                }

                Button(action: {
                    if deviceStatus != nil {
                        // Edit mode
                        deviceID = ""
                        deviceStatus = nil
                        lastOnline = nil
                        UserDefaults.standard.removeObject(forKey: "selectedDeviceID")
                    } else {
                        fetchDeviceInfo()
                    }
                }) {
                    Text(deviceStatus != nil ? "Edit Device ID" : "Check Device")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(deviceStatus != nil ? Color.orange : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                if let status = deviceStatus, let last = lastOnline {
                    VStack(spacing: 10) {
                        Text("Status: \(status)")
                            .foregroundColor(status == "online" ? .green : .red)
                        Text("Last Online: \(last)")
                            .foregroundColor(.gray)
                    }
                } else if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Device Connection")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .onAppear {
            if !storedDeviceID.isEmpty {
                deviceID = storedDeviceID
                let db = Firestore.firestore()
                let summaryRef = db.collection("Device")
                    .document(deviceID)
                    .collection("LastUpdated")
                    .document("Summary")

                summaryRef.addSnapshotListener { docSnapshot, error in
                    if let error = error {
                        print("❌ Listener error: \(error.localizedDescription)")
                        self.errorMessage = "Error: \(error.localizedDescription)"
                        return
                    }

                    guard let doc = docSnapshot, doc.exists else {
                        print("⚠️ Device not found.")
                        self.errorMessage = "Device not found or error occurred."
                        return
                    }

                    if let ts = doc["Timestamp"] as? Timestamp {
                        let formatter = DateFormatter()
                        formatter.dateStyle = .medium
                        formatter.timeStyle = .short
                        self.lastOnline = formatter.string(from: ts.dateValue())
                        self.deviceStatus = "online"
                        self.errorMessage = nil
                       
                    } else {
                        self.errorMessage = "Timestamp missing."
                        print("⚠️ Timestamp missing.")
                    }
                }
            }
        }
    }

    private func fetchDeviceInfo() {
        let db = Firestore.firestore()
        let summaryRef = db.collection("Device")
            .document(deviceID)
            .collection("LastUpdated")
            .document("Summary")
 
        summaryRef.addSnapshotListener { docSnapshot, error in
            if let error = error {
                self.errorMessage = "Error: \(error.localizedDescription)"
                return
            }
 
            guard let doc = docSnapshot, doc.exists else {
                self.errorMessage = "Device not found or error occurred."
                return
            }
 
            if let ts = doc["Timestamp"] as? Timestamp {
                let formatter = DateFormatter()
                formatter.dateStyle = .medium
                formatter.timeStyle = .short
                self.lastOnline = formatter.string(from: ts.dateValue())
                self.deviceStatus = "online"
                self.errorMessage = nil
                UserDefaults.standard.set(deviceID, forKey: "selectedDeviceID")
            } else {
                self.errorMessage = "Timestamp missing."
            }
        }
    }
}
