import Foundation
import UIKit
import CoreML
import NaturalLanguage
import Messages

class SpamSMSBlocker {
    private var model: NLModel?

    init() {
        loadSpamDetectionModel()
    }

    private func loadSpamDetectionModel() {
        guard let modelURL = Bundle.main.url(forResource: "SpamDetectionModel", withExtension: "mlmodelc") else {
            print("Model file not found.")
            return
        }

        do {
            let compiledModel = try NLModel(contentsOf: modelURL)
            model = compiledModel
        } catch {
            print("Failed to load the model: \(error.localizedDescription)")
        }
    }

    func isSpamMessage(_ message: String) -> Bool {
        guard let model = model else {
            print("Model not loaded.")
            return false
        }
        
        let prediction = model.predictedLabel(for: message)
        return prediction == "spam"
    }
}

class SMSFilterExtension: NSObject, MFMessageFilterExtension {
    private let spamBlocker = SpamSMSBlocker()

    func handle(_ queryRequest: MFMessageFilterQueryRequest, 
                context: MFMessageFilterExtensionContext, 
                completion: @escaping (MFMessageFilterQueryResponse) -> Void) {

        let response = MFMessageFilterQueryResponse()

        if let messageBody = queryRequest.messageBody, spamBlocker.isSpamMessage(messageBody) {
            response.action = .filter
        } else {
            response.action = .allow
        }

        completion(response)
    }
}

// Usage Example:
let blocker = SpamSMSBlocker()
let testMessage = "Congratulations! You've won a $1000 gift card. Click here to claim it."
if blocker.isSpamMessage(testMessage) {
    print("Spam detected!")
} else {
    print("Message is safe.")
}

/* Steps to Build:
 1. Create a CoreML Model (e.g., SpamDetectionModel.mlmodel).
 2. Integrate the model into your project.
 3. Add proper entitlements for SMS filtering (Capability: "Message Filter App").
 4. Follow Apple's guidelines for creating and testing a Message Filter Extension.
 */
