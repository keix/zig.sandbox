const wasmUrl = "https://9th.tokyo/web";

try {
  const response: Resposnse = await fetch(wasmUrl);
  if (!response.ok) {
    throw new Error(`Failed to fetch wasm file: ${response.statusText}`);
  }

  const data: ArrayBuffer = await response.arrayBuffer();
  const wasmModule = await WebAssembly.instantiate(data, {
    env: {
      print: (num: number) => console.log("Output from Wasm:", num)
    }
  });

  const { add } = wasmModule.instance.exports as {
    add: (a: number, b: number) => number
  };
  add(10, 15);
} catch (err) {
  console.error('Failed to fetch or instantiate the wasm file:', err);
}

