import os
from flask import Flask, request, jsonify
import tensorflow as tf
import numpy as np
import cv2
from google.cloud import storage
from urllib.parse import quote  # Import quote from urllib.parse

app = Flask(__name__)

# Initialize Google Cloud Storage client
storage_client = storage.Client()

# GCS bucket and model file path
bucket_name = 'fruit_ripeness'
model_path = 'model/EfficientnetBo.h5'

# Download the model from GCS
bucket = storage_client.get_bucket(bucket_name)
blob = bucket.blob(model_path)
blob.download_to_filename('EfficientnetBo.h5')

# Load your model
model = tf.keras.models.load_model('EfficientnetBo.h5')

def preprocess_image(image_path):
    image = cv2.imread(image_path)
    image = cv2.resize(image, (224, 224))  
    image = image / 255.0  
    return image

@app.route('/upload_and_predict', methods=['POST'])
def upload_and_predict():
    if request.method == 'POST':
        if 'image' not in request.files:
            return jsonify({'error': 'No image file found'})
        
        image_file = request.files['image']
        temp_image_path = 'temp_image.jpg'
        image_file.save(temp_image_path)
        
        processed_image = preprocess_image(temp_image_path)
        predictions = model.predict(np.expand_dims(processed_image, axis=0))
        predicted_class_index = np.argmax(predictions)
        predicted_class = ['Overripe', 'Ripe', 'Unripe'][predicted_class_index]

        os.remove(temp_image_path)
        
        return jsonify({'predicted_class': predicted_class})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=os.environ.get('PORT', 8080))

