// client/src/components/CardUpload.js
import React, { useState } from 'react';
import axios from 'axios';

const CardUpload = () => {
  const [file, setFile] = useState(null);

  const handleUpload = async () => {
    const formData = new FormData();
    formData.append('cardImage', file);

    try {
      const res = await axios.post('/upload', formData);
      console.log('Image uploaded:', res.data.image_url);
    } catch (err) {
      console.error('Upload failed:', err);
    }
  };

  return (
    <div>
      <input type="file" onChange={e => setFile(e.target.files[0])} />
      <button onClick={handleUpload}>Upload</button>
    </div>
  );
};

export default CardUpload;
