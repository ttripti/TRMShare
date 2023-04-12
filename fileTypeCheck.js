function isStartWith(file, bytes) {
  return new Promise((resolve, reject) => {
    const fileReader = new FileReader()

    fileReader.onload = function () {
      const fileArrayBuffer = fileReader.result
      const fileUint8Array = new Uint8Array(fileArrayBuffer)
      const ifStartWith = bytes.every((value, index) => {
        return value === fileUint8Array[index]
      })
      resolve(ifStartWith)
    }

    fileReader.onerror = function(error){
      reject(false)
    }

    fileReader.readAsArrayBuffer(file)
  })
}

async function isPDF(file) {
   const pdfNumbers = [0x25, 0x50, 0x44, 0x46]
  return await isStartWith(file, pdfNumbers)
}

function display(){
  alert('hello');
}
