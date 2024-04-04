import os
from flask import Flask, request, jsonify
import tensorflow as tf
from tensorflow import keras
from keras.preprocessing import image
import numpy as np

app = Flask(__name__)

# Load your model
model = tf.keras.models.load_model('D:\Second Year\Courseworks\Final DSGP\EfficientnetBo.h5')

  
def preprocess_image(image_path):
    IMAGE_SIZE = (224, 224)
    img = image.load_img(image_path, target_size=IMAGE_SIZE)
    img_array = image.img_to_array(img)
    img_array /= 255.0
    img_array = np.expand_dims(img_array, axis=0)
    return img_array


@app.route('/upload_and_predict', methods=['POST'])
def upload_and_predict():
    if request.method == 'POST':
        
        if 'image' not in request.files:
            return jsonify({'error': 'No image file found'}), 400
        
        image_file = request.files['image']
        
        
        temp_image_path = 'temp_image.jpg'
        image_file.save(temp_image_path)
        
        
        processed_image = preprocess_image(temp_image_path)
        
    
        predictions = model.predict(processed_image)
        
        class_names = {
            0: 'Over Ripe',
            1: 'Ripe',
            2: 'Unripe'
        }
        # class_names = ['Over ripe', 'Ripe', 'Unripe']
        predicted_class_index = np.argmax(predictions,axis=1)
        predicted_class = class_names[predicted_class_index[0]]
        
        
        os.remove(temp_image_path)
        
        return jsonify({'predicted_class': predicted_class})

if __name__ == '__main__':
    app.run(host='0.0.0.0',debug=True)  
