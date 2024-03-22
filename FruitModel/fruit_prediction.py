from flask import Flask, request, jsonify
import numpy as np
from PIL import Image
import io
from keras.models import load_model

model = load_model("D:/IIT/Data Science Group Project/Notebook/Multi-modal-Fruit-Ripeness-Detection-System/FruitModel/EfficientnetB0.keras")

app = Flask(__name__)

def predict(image_data):
    image = np.array(Image.open(io.BytesIO(image_data)))
    # Preprocess the image here
    prediction = model.predict(image)
    # Post-process the prediction if needed
    return prediction

@app.route('/predict', methods=['POST'])
def prediction():
    if 'image' not in request.files:
        return jsonify({'error': 'No image provided'})
    file = request.files['image']
    img_bytes = file.read()
    prediction = predict(img_bytes)
    return jsonify({'prediction': prediction.tolist()})

if __name__ == '__main__':
        app.run(host='0.0.0.0', port=5000, debug=True)