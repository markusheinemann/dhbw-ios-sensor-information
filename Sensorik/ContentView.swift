import SwiftUI

struct ContentView: View {
    let sensorManager = SensorManager()
    @State private var accelerometerData: String = ""
    @State private var gyroData: String = ""
    @State private var magnoData: String = ""
    
    var body: some View {
        VStack {
            Text("Sensor Information")
                .font(.largeTitle)
                .padding()
            
            Text("Accelerometer")
                .font(.headline)
                .padding(1)
            Text(accelerometerData)
                .padding()
            
            Text("Gyroscope")
                .font(.headline)
                .padding(1)
            Text(gyroData)
                .padding()
            
            Text("Magnetometer")
                .font(.headline)
                .padding(1)
            Text(magnoData)
                .padding()
            
            Spacer()
        }
        .onAppear {
            sensorManager.startAccelerometerUpdates { data in self.accelerometerData = data }
            sensorManager.startGyroUpdates { data in self.gyroData = data }
            sensorManager.startMagnoUpdate { data in self.magnoData = data }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
