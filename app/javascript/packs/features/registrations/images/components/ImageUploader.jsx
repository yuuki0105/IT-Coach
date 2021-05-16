import React, {useEffect, useState, useMemo} from 'react';
import {useDropzone} from 'react-dropzone';
import axios from "axios";
export default function ImageUploader(props) {
  const {
    files,setfiles
  } = props
  const thumbsContainer = {
    display: 'flex',
    flexDirection: 'row',
    flexWrap: 'wrap',
    marginTop: 16
  };
  const thumb = {
    display: 'inline-flex',
    borderRadius: 2,
    border: '1px solid #eaeaea',
    marginBottom: 8,
    marginRight: 8,
    width: 100,
    height: 100,
    padding: 4,
    boxSizing: 'border-box'
  };
  const thumbInner = {
    display: 'flex',
    minWidth: 0,
    overflow: 'hidden'
  };
  const img = {
    display: 'block',
    width: 'auto',
    height: '100%'
  };
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
    onDrop: acceptedFiles => {
      props.setFiles(acceptedFiles.map(file =>
        Object.assign(file, { preview: URL.createObjectURL(file) })
      ));
      // acceptedFiles.forEach(image => {
      //   let params = new FormData();
      //   params.append("user[image]", image);
      //   console.log("image", image);
      //   const response = axios.put("/registrations/image", params)
      // })
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
  const thumbs = files.map(file => (
    <div style={thumb} key={file.name}>
      <div style={thumbInner}>
        <img
          src={file.preview}
          style={img}
        />
      </div>
    </div>
  ));
  useEffect(() => () => {
    // Make sure to revoke the data uris to avoid memory leaks
    files.forEach(file => URL.revokeObjectURL(file.preview));
  }, [files]);
  const uploadImages = () => {
    // this.setState({ uploadErrors: [] });
    files.forEach(image => {
      let params = new FormData();
      params.append("user[image]", image);
      console.log("image", image);
      const response = axios.put("/registrations/image", params)
      // axios
      //   .post("/api/upload_images", params)
      //   .then(response => {
      //     const d = response.data;
      //   })
      //   .catch(error => {
      //     let messages = this.state.uploadErrors;
      //     error.response.data.errors.forEach(v => messages.push(v));
      //   });
    });
  };
  return (
    <section className="container">
      <div {...getRootProps({style})}>
        <input {...getInputProps()} />
        <p>ファイルを添付してください</p>
      </div>
      <aside style={thumbsContainer}>
        {thumbs}
      </aside>
      <button onClick={() => uploadImages()}>送信する</button>
    </section>
  );
}