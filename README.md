# 🍌🥭🍈 Multi-modal Fruit Ripeness Detection System

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.11.5-blue?logo=python" />
  <img src="https://img.shields.io/badge/Flutter-3.16.3-blue?logo=flutter" />
  <img src="https://img.shields.io/badge/TensorFlow-2.15.0-orange?logo=tensorflow" />
  <img src="https://img.shields.io/badge/Flask-API-black?logo=flask" />
  <img src="https://img.shields.io/badge/Model-EfficientNetB0-green" />
  <img src="https://img.shields.io/badge/Accuracy-96%25-brightgreen" />
  <img src="https://img.shields.io/badge/License-IIT-lightgrey" />
</p>

> A mobile application powered by deep learning that detects the ripeness level of **Banana**, **Mango**, and **Papaya** from a single photo — with 96% accuracy.

---

## 📖 Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [System Architecture](#system-architecture)
- [Tech Stack](#tech-stack)
- [Dataset](#dataset)
- [Model Performance](#model-performance)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Backend Setup (Flask API + ML Model)](#backend-setup-flask-api--ml-model)
  - [Frontend Setup (Flutter App)](#frontend-setup-flutter-app)
- [How It Works](#how-it-works)
- [Project Structure](#project-structure)
- [Results & Benchmarks](#results--benchmarks)
- [Limitations](#limitations)
- [Future Enhancements](#future-enhancements)
- [Team](#team)
- [Acknowledgements](#acknowledgements)
- [References](#references)

---

## Overview

The **Multi-modal Fruit Ripeness Detection System** addresses a real-world problem in the fruit supply chain: accurately determining the ripeness of fruits without manual inspection. Most existing systems only handle a single fruit type, making them impractical for traders and consumers who deal with multiple varieties.

This system unifies ripeness detection for three tropical fruits — **Banana**, **Mango**, and **Papaya** — into a single mobile application. Users simply select the fruit type, capture or upload a photo, and receive an instant ripeness classification: **Unripe**, **Ripe**, or **Over Ripe**.

Built as a BSc (Hons) Artificial Intelligence and Data Science final year project at the **Informatics Institute of Technology** in collaboration with **Robert Gordon University Aberdeen**.

---

## Key Features

- 📱 **Cross-platform mobile app** — works on both Android and iOS (built with Flutter)
- 🤖 **Deep learning classification** — uses EfficientNetB0 for accurate image-based ripeness detection
- 🍌🥭🍈 **Multi-fruit support** — Banana, Mango, and Papaya in a single system
- 📸 **Camera & gallery input** — capture a live photo or upload from device gallery
- ⚡ **Fast inference** — results delivered in approximately 2 seconds
- 🔒 **Privacy-first** — no user data is stored by the system
- 🎯 **96% overall accuracy** across all three fruit classes

---

## System Architecture

The system follows a **3-tier architecture**:

```
┌─────────────────────────────────────────────┐
│           Presentation Tier                 │
│         Flutter Mobile Application          │
│  (Camera/Gallery input → Ripeness display)  │
└───────────────────┬─────────────────────────┘
                    │ HTTP Request (image)
┌───────────────────▼─────────────────────────┐
│            Integration Tier                 │
│               Flask REST API                │
│  (Image preprocessing → Model invocation)   │
└───────────────────┬─────────────────────────┘
                    │ Prediction
┌───────────────────▼─────────────────────────┐
│               Logic Tier                    │
│           EfficientNetB0 Model              │
│  (Trained CNN — classifies ripeness level)  │
└─────────────────────────────────────────────┘
```

**Flow:**
1. User selects fruit type and uploads/captures an image via the mobile app.
2. The app sends the image to the Flask API.
3. The API preprocesses the image and forwards it to the EfficientNetB0 model.
4. The model returns a prediction (Unripe / Ripe / Over Ripe).
5. The result is displayed to the user.

---

## Tech Stack

| Layer | Technology | Version |
|---|---|---|
| ML Framework | TensorFlow / Keras | 2.15.0 |
| Model Architecture | EfficientNetB0 (CNN) | — |
| Backend API | Flask | Latest |
| Mobile Framework | Flutter | 3.16.3 |
| Mobile Language | Dart | 3.2.3 |
| ML Language | Python | 3.11.5 |
| IDE (ML) | Jupyter Notebook | 6.5.4 |
| IDE (Mobile) | Visual Studio Code | 1.81.1 |
| Version Control | Git / GitHub | — |

**Python Libraries:**

| Library | Version |
|---|---|
| NumPy | 1.24.3 |
| Matplotlib | 3.7.2 |
| Scikit-Learn | 1.4.0 |
| OpenCV | 4.9.0 |
| Seaborn | 0.12.2 |

**Flutter Packages:**

| Package | Version |
|---|---|
| image_picker | ^1.0.7 |
| cupertino_icons | ^1.0.2 |
| flutter_lints | ^2.0.0 |

---

## Dataset

Training data was sourced from [Kaggle](https://www.kaggle.com) and consists of labelled images across three ripeness categories per fruit.

| Fruit | Unripe | Ripe | Over Ripe | Total |
|---|---|---|---|---|
| Banana | 1,050 | 1,819 | 1,842 | 4,711 |
| Mango | 1,104 | 281 | 258 | 1,643 |
| Papaya | 100 | 100 | 100 | 300 |

> **Note:** Datasets were balanced by reducing the count of the dominant class to ensure unbiased training.

**Preprocessing:**
- Images resized to **224 × 224** pixels
- Pixel values rescaled to `[0, 1]`
- Augmentation applied during training: zoom (0.2), width/height shift (0.2), fill mode `nearest`

---

## Model Performance

### Classification Report (EfficientNetB0)

| Class | Precision | Recall | F1-Score | Support |
|---|---|---|---|---|
| Over Ripe | 0.98 | 0.90 | 0.94 | 220 |
| Ripe | 0.91 | 0.98 | 0.94 | 220 |
| Unripe | 0.99 | 0.99 | 0.99 | 220 |
| **Overall Accuracy** | | | **0.96** | **660** |

### Confusion Matrix (Test Set)

```
Predicted →    Over Ripe   Ripe   Unripe
Actual ↓
Over Ripe  [   198         21       1  ]
Ripe       [     3        215       2  ]
Unripe     [     1          1     218  ]
```

### Model Comparison

| Model | Image Size | Training Acc | Training Loss | Test Acc | Test Loss |
|---|---|---|---|---|---|
| **EfficientNetB0** ✅ | 224×224 | — | — | **0.96** | **lowest** |
| EfficientNetB1 | 240×240 | 0.9648 | 0.0724 | 0.9606 | 0.0916 |
| EfficientNetB2 | 260×260 | 0.9383 | 0.1515 | 0.9484 | 0.1579 |
| EfficientNetB3 | 300×300 | 0.9100 | 0.2190 | 0.9348 | 0.1903 |
| CNN | 256×256 | 0.9396 | 0.1714 | 0.9485 | 0.1618 |
| ResNet50 | 256×256 | 0.9440 | 0.2384 | 0.9453 | 0.2018 |
| VGG16 | 224×224 | 0.3294 | 1.0987 | 0.2508 | 1.1001 |

EfficientNetB0 was selected as it achieves the highest test accuracy with the lowest test loss, using fewer computational resources than its larger variants.

---

## Getting Started

### Prerequisites

- Python 3.11+
- Flutter 3.16+
- Dart 3.2+
- Anaconda (recommended for the ML environment)
- Git

---

### Backend Setup (Flask API + ML Model)

**1. Clone the repository**

```bash
git clone https://github.com/vgry5/Multi-modal-Fruit-Ripeness-Detection-System.git
cd Multi-modal-Fruit-Ripeness-Detection-System
```

**2. Create and activate a virtual environment**

```bash
# Using conda (recommended)
conda create -n fruit-ripeness python=3.11.5
conda activate fruit-ripeness

# Or using venv
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
```

**3. Install Python dependencies**

```bash
pip install tensorflow==2.15.0 flask numpy matplotlib scikit-learn opencv-python seaborn
```

**4. Train the model (or use a pre-trained model)**

Open `model_training.ipynb` in Jupyter Notebook and run all cells. The trained model will be saved as `EfficientnetB0.keras`.

```bash
jupyter notebook model_training.ipynb
```

**5. Start the Flask API**

```bash
python app.py
```

The API will be running at `http://localhost:5000`. Make a note of your machine's local IP address — you'll need it for the Flutter app.

---

### Frontend Setup (Flutter App)

**1. Ensure Flutter is installed**

```bash
flutter doctor
```

**2. Navigate to the Flutter project directory**

```bash
cd mobile_app
```

**3. Install Flutter dependencies**

```bash
flutter pub get
```

**4. Update the API endpoint**

In the relevant Dart file, update the API base URL to point to your Flask server's IP address:

```dart
const String apiUrl = 'http://<YOUR_LOCAL_IP>:5000/predict';
```

**5. Run the app**

```bash
# On a connected Android/iOS device or emulator
flutter run
```

---

## How It Works

```
User opens app
      │
      ▼
Select fruit type (Banana / Mango / Papaya)
      │
      ▼
Capture image via camera OR upload from gallery
      │
      ▼
App sends image to Flask API (HTTP POST)
      │
      ▼
API preprocesses image (resize to 224×224, normalise)
      │
      ▼
EfficientNetB0 model predicts ripeness class
      │
      ▼
API returns prediction → App displays result
      │
      ▼
   Unripe / Ripe / Over Ripe
```

---

## Project Structure

```
Multi-modal-Fruit-Ripeness-Detection-System/
│
├── ml_model/
│   ├── model_training.ipynb        # Jupyter notebook — model training
│   ├── EfficientnetB0.keras        # Saved trained model
│   └── data/                       # Dataset directory (train / val / test)
│
├── backend/
│   └── app.py                      # Flask REST API
│
├── mobile_app/
│   ├── lib/
│   │   ├── main.dart               # App entry point
│   │   ├── home_page.dart          # Home / welcome screen
│   │   ├── help_page.dart          # Instructions screen
│   │   ├── predict_page.dart       # Image capture & prediction screen
│   │   └── result_page.dart        # Ripeness result display
│   ├── pubspec.yaml
│   └── assets/
│
└── README.md
```

---

## Results & Benchmarks

| Benchmark | Existing System | This System |
|---|---|---|
| Ripeness Classification (CNN, Mango) | ~94% | **96%** (EfficientNetB0) |
| Ripeness Classification (Random Forest, Papaya) | ~94.75% | **96%** (EfficientNetB0) |
| Number of fruits supported | 1 | **3** |
| Mobile application available | ❌ | ✅ |
| Inference time | — | ~2 seconds |

---

## Limitations

| Limitation | Proposed Solution |
|---|---|
| Only 3 fruit types supported | Expand model to cover more fruits |
| Only 3 ripeness levels (Unripe, Ripe, Over Ripe) | Add finer-grained stages |
| Model hosted locally via Flask — not scalable for high traffic | Deploy to cloud (AWS / GCP / Azure) |
| Fruits must be scanned individually | Implement batch scanning for industrial use |
| No accessibility features for users with special needs | Add voice-over support, screen reader compatibility |
| No user profile or history storage | Add a database layer (e.g., Firebase) |

---

## Future Enhancements

- ☁️ **Cloud deployment** — move the Flask model server to a cloud platform for scalability
- 🗃️ **Database integration** — store scan history, expiry alerts, and user preferences
- 🌍 **Multi-language support** — expand accessibility for international users
- 🧠 **More fruit types** — extend the model to additional varieties
- 🏭 **Batch scanning** — enable industrial-scale classification of large fruit consignments
- 🛒 **In-app store** — allow users to order fruits directly based on ripeness preferences
- 📖 **Recipe suggestions** — recommend recipes based on detected ripeness level

---

## References

- F.M.A. Mazen and A.A. Nashat (2019). *Ripeness classification of bananas using an artificial neural network.* Arabian Journal for Science and Engineering. https://link.springer.com/article/10.1007/s13369-018-03695-5
- N. Saranya et al. (2022). *Banana ripeness stage identification: a deep learning approach.* Journal of Ambient Intelligence and Humanized Computing. https://link.springer.com/article/10.1007/s12652-021-03267-w
- K. Kipli et al. (2018). *Image Processing Mobile Application For Banana Ripeness Evaluation.* ICASSDA. https://ieeexplore.ieee.org/abstract/document/8477600
- D.S. Prabha and J.S. Kumar (2015). *Assessment of banana fruit maturity by image processing technique.* Journal of Food Science and Technology. https://link.springer.com/article/10.1007/s13197-013-1188-3
- L.F.S. Pereira et al. (2018). *Predicting the ripening of papaya fruit with digital imaging and random forests.* https://www.sciencedirect.com/science/article/pii/S016816991731030X
- S. Gayathri et al. (2021). *Detection of Papaya Ripeness Using Deep Learning Approach.* https://ieeexplore.ieee.org/document/9544902
- M.M. Al-Masawabe et al. (2021). *Papaya maturity Classification Using Deep Convolutional Neural Networks.*
- R.P. Salunkhe and A.A. Patil (2015). *Image processing for mango ripening stage detection: RGB and HSV method.* ICIIP. https://ieeexplore.ieee.org/document/7414796
- M.F. Mavi et al. (2019). *Mango ripeness classification system using hybrid technique.* Indonesian Journal of Electrical Engineering and Computer Science. https://www.researchgate.net/publication/331834374

---

<p align="center">
  © 2024 Informatics Institute of Technology. All rights reserved.
</p>
