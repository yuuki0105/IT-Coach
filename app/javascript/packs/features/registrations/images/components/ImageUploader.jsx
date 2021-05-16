import React from 'react';
import {useDropzone} from 'react-dropzone';

export default function ImageUploader(props) {
  const { file, setFile } = props;

  const {
    getRootProps,
    getInputProps,
  } = useDropzone({
    accept: 'image/*',
    multiple: false,
    onDrop: acceptedFiles => {
      if (acceptedFiles.length < 1) { return null; }
      const image = acceptedFiles[0]
      setFile(Object.assign(image, { preview: URL.createObjectURL(image) }));
    }
  });

  return (
    <div>
      <div {...getRootProps()} className="text-center bg-gray-50 flex-1 flex flex-col p-4 border-2 border-borderGray rounded-sm border-dashed text-subtext">
        <input {...getInputProps()} />
        <p>画像ファイルを添付（20MB以内）</p>
      </div>
      {Object.keys(file).length > 0 &&
        <aside className="d-flex flex-row flex-wrap mt-4">
          <img
            src={file.preview}
            className="inline-flex border-2 border-borderGray rounded-full w-20 h-20"
          />
        </aside>
      }
    </div>
  );
}