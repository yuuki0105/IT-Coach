import React, {useEffect, useState, useMemo} from 'react';
import {useDropzone} from 'react-dropzone';

export default function ImageUploader(props) {
  const { file, setFile } = props;

  const baseStyle = {
    flex: 1,
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    padding: '20px',
    borderWidth: 2,
    borderRadius: 2,
    borderColor: '#eeeeee',
    borderStyle: 'dashed',
    backgroundColor: '#fafafa',
    color: '#bdbdbd',
    outline: 'none',
    transition: 'border .24s ease-in-out'
  };

  const activeStyle = {
    borderColor: '#2196f3'
  };

  const acceptStyle = {
    borderColor: '#00e676'
  };

  const rejectStyle = {
    borderColor: '#ff1744'
  };

  const {
    getRootProps,
    getInputProps,
    isDragActive,
    isDragAccept,
    isDragReject
  } = useDropzone({
    accept: 'image/*',
    multiple: false,
    onDrop: acceptedFiles => {
      if (acceptedFiles.length < 1) { return null; }
      const image = acceptedFiles[0]
      setFile(Object.assign(image, { preview: URL.createObjectURL(image) }));
    }
  });

  const style = useMemo(() => ({
    ...baseStyle,
    ...(isDragActive ? activeStyle : {}),
    ...(isDragAccept ? acceptStyle : {}),
    ...(isDragReject ? rejectStyle : {})
  }), [
    isDragActive,
    isDragReject,
    isDragAccept
  ]);

  return (
    <section className="container">
      <div {...getRootProps({style})}>
        <input {...getInputProps()} />
        <p>画像ファイルを添付（20MB以内）</p>
      </div>
      {Object.keys(file).length > 0 &&
        <aside className="d-flex flex-row flex-wrap mt-4">
          <img
            src={file.preview}
            className="inline-flex border-2 border-borderGray rounded-full w-20 h-20 p-1 box-border"
          />
        </aside>
      }
    </section>
  );
}