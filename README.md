# Pinata Cloud SDK for Dart & Flutter

Easily interact with [Pinata Cloud](https://www.pinata.cloud/) from your Dart or Flutter apps. This SDK currently supports:

- ✅ Uploading files to IPFS
- ✅ Creating signed upload URLs

> More features like pinning/unpinning, listing files, and metadata management coming soon.

---

## 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  pinata_cloud_sdk: ^0.0.1
```

Then run:

```bash
flutter pub get
```

---

## 🚀 Getting Started

```dart
import 'package:pinata_cloud_sdk/pinata_cloud_sdk.dart';

final sdk = PinataSDK(token: '<YOUR_PINATA_JWT>');

// Upload a file
final file = File('/path/to/file.png');
final response = await sdk.upload.uploadFile(
  file: file,
  name: 'example.png',
);
print(response.cid);
```

---

## ✍️ Create Signed Upload URL

```dart
final signedUrl = await sdk.upload.signUpload(
  date: DateTime.now().millisecondsSinceEpoch,
  expires: DateTime.now().add(Duration(hours: 1)).millisecondsSinceEpoch,
  maxFileSize: 5000000,
  allowMimeTypes: ['image/png', 'image/jpeg'],
  filename: 'example.png',
);
print(signedUrl.data);
```

---

## 🔐 Authentication
All requests require a **JWT token** from your Pinata account:
- [Get a JWT Token](https://app.pinata.cloud/developers/api-keys)

---

## 📁 Project Structure
```
pinata_cloud_sdk/
├── lib/
│   ├── pinata_cloud_sdk.dart
│   └── src/
│       ├── api/
│       ├── models/
│       └── services/
├── test/
├── example/
├── pubspec.yaml
└── README.md
```

---

## 📄 License
MIT © [Romavic dos Anjos](https://github.com/romavicdosanjos)
