import React, { useState } from 'react';
import PropTypes from "prop-types";
import ImageUploader from "./ImageUploader"
import axios from "axios";

function ImageForm(props) {
  const [file, setFile] = useState({});
  const [errors, setErrors] = useState([]);
  const { imageUrl } = props

  const uploadImages = async () => {
    let params = new FormData();
    params.append("user[image]", file);
    try {
      await axios.put("/api/registrations/image", params)
      window.location.href = "/registrations/profile";
      // TODO: うまく遷移しない
    } catch (err) {
      const response = err.response;
      setErrors(response.data.error_messages);
    }
  }

  return (
    <div className="mt-4">
      <ImageUploader setFile={setFile} file={file} />
      {errors.map(error =>
        <ul>
          <li>{error}</li>
        </ul>
      )}
      {imageUrl && <img src={imageUrl} className=" mt-4 w-20 h-20 rounded-full" />}
      <div className="py-4 space-y-4 sm:space-y-0 sm:space-x-6 mt-6 sm:mt-8 sm:flex">
        <a href="../about_coach" className="button_sub">戻る</a>
        <button className="button_main" onClick={() => uploadImages()}>
          保存して次へ
        </button>
      </div>
    </div>
  )
}

ImageForm.propTypes = {
  name: PropTypes.string,
}

export default ImageForm