import CoreMotion

class SensorManager {
    let motionManager = CMMotionManager()
    
    func startAccelerometerUpdates(completion: @escaping (String) -> Void) {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
                guard let accelerometerData = data else { return }
                
                // Process accelerometer data
                let acceleration = accelerometerData.acceleration
                
                completion(String(
                    format: "x: %.2f, y: %.2f, z: %.2f",
                    acceleration.x,
                    acceleration.y,
                    acceleration.z
                ))
            }
        }
    }
    
    func startGyroUpdates(completion: @escaping (String) -> Void) {
        if motionManager.isGyroAvailable {
            motionManager.gyroUpdateInterval = 0.1
            motionManager.startGyroUpdates(to: .main) {(data, error) in
                guard let gyroData = data else {return}
                
                let rotation = gyroData.rotationRate
                
                completion(String(
                    format: "%.2f, y: %.2f, z: %.2f",
                    rotation.x,
                    rotation.y,
                    rotation.z
                ))
            }
        }
    }
    
    func startMagnoUpdate(completion: @escaping (String) -> Void) {
        if motionManager.isMagnetometerAvailable {
            motionManager.magnetometerUpdateInterval = 0.1
            motionManager.startMagnetometerUpdates(to: .main) {(data, error) in
                guard let magnoData = data else {return}
                
                let field = magnoData.magneticField
                
                completion(String(
                    format: "%.2f, y: %.2f, z: %.2f",
                    field.x,
                    field.y,
                    field.z
                ))
            }
        }
    }
}
