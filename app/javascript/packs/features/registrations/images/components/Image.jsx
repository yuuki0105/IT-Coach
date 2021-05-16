import React, {useState, useEffect} from 'react';
import ImageUploader from "./ImageUploader"
import axios from "axios";

export default function Image(props) {
  const { image } = props;
  const [file, setFile] = useState(null);

  useEffect(() => () => {
    URL.revokeObjectURL(file.preview);
  }, [file]);

  console.log("image", image);
  const uploadImages = () => {
    // this.setState({ uploadErrors: [] });
    console.log(file)
    let params = new FormData();
    params.append("user[image]", file);
    const response = axios.put("/api/registrations/image", params)
    window.location.href = "/registrations/profile";
  }

  return (
    <div className="mt-4">
      <ImageUploader setFile={setFile} file={file} />
      <img src={image} className="w-20 h-20 rounded-full"></img>
      <div className="py-4 space-y-4 sm:space-y-0 sm:space-x-6 mt-6 sm:mt-8 sm:flex">
        <a className="button_sub" href="../about_coach">戻る</a>

        <button className="button_main" onClick={() => uploadImages()}>
          保存して次へ
        </button>
      </div>
    </div>
  )
}