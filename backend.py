import os
from flask import Flask, request, jsonify
import tensorflow as tf
import numpy as np
import cv2

app = Flask(__name__)

# Load your model
model = tf.keras.models.load_model('C:/Users/admin/Datasets/Multi-modal-Fruit-Ripeness-Detection-System/EfficientnetBo.h5')
  
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
        
   
        labels = {'0': 'Overripe', '1': 'Ripe', '2': 'Unripe'} 
        predicted_class_index = np.argmax(predictions)
        predicted_class = labels[str(predicted_class_index)]
        
        
        os.remove(temp_image_path)
        
        return jsonify({'predicted_class': predicted_class})

if __name__ == '__main__':
    app.run(host='0.0.0.0',debug=True)  
