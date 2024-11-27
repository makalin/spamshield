# Spam Shield: Spam SMS Blocker for iOS

Spam SMS Blocker is an iOS app designed to filter out unwanted and spam messages using CoreML and Apple's Message Filter Extension. The app leverages a trained Natural Language Processing (NLP) model to identify spam messages and block them effectively.

---

## Features

- **Machine Learning Integration**: Utilizes a custom CoreML model to detect spam messages.
- **Apple Message Filter Extension**: Seamlessly integrates into iOS to provide message filtering.
- **Real-time Detection**: Automatically filters spam messages without user intervention.

---

## Prerequisites

- Xcode 12 or later
- iOS 14 or later
- A trained CoreML model (`SpamDetectionModel.mlmodel`)

---

## Getting Started

### 1. Clone the Repository
```bash
$ git clone https://github.com/yourusername/spam-sms-blocker.git
$ cd spam-sms-blocker
```

### 2. Add the CoreML Model
- Include your trained CoreML model (`SpamDetectionModel.mlmodel`) in the project directory.

### 3. Configure the Project
- Open the project in Xcode.
- Enable the **Message Filter App** capability in the project settings.

### 4. Build and Run
- Select a simulator or a physical iOS device.
- Build and run the app.

---

## How It Works

1. **Model Loading**: The app loads the CoreML model (`SpamDetectionModel.mlmodel`) during initialization.
2. **Message Filtering**: The Message Filter Extension analyzes incoming SMS content and classifies it as spam or safe.
3. **Spam Handling**: Messages identified as spam are blocked from appearing in the user's inbox.

---

## Example Usage

```swift
let blocker = SpamSMSBlocker()
let testMessage = "Congratulations! You've won a $1000 gift card. Click here to claim it."
if blocker.isSpamMessage(testMessage) {
    print("Spam detected!")
} else {
    print("Message is safe.")
}
```

---

## File Structure

```
|-- SpamSMSBlocker.swift
|-- SMSFilterExtension.swift
|-- SpamDetectionModel.mlmodel
|-- README.md
```

---

## Contributing

1. Fork the repository.
2. Create a feature branch: `git checkout -b my-feature`
3. Commit your changes: `git commit -m 'Add some feature'`
4. Push to the branch: `git push origin my-feature`
5. Open a pull request.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- Apple Developer Documentation
- CoreML and NLP APIs
