import { useState } from "react";

export default function Home() {
  const [file, setFile] = useState<File | null>(null);
  const [result, setResult] = useState<string>("");

  const upload = async () => {
    if (!file) return;
    const formData = new FormData();
    formData.append("file", file);
    const res = await fetch("http://localhost:8000/api/upload", {
      method: "POST",
      body: formData,
    });
    const json = await res.json();
    setResult(\`Uploaded \${json.filename} (\${json.size} bytes)\`);
  };

  return (
    <div className="min-h-screen flex flex-col items-center justify-center bg-gradient-to-r from-purple-500 to-indigo-600 text-white p-4">
      <h1 className="text-4xl font-bold mb-4">📤 Visionary Upload</h1>
      <input
        type="file"
        onChange={(e) => setFile(e.target.files?.[0] || null)}
        className="mb-4 text-black"
      />
      <button
        onClick={upload}
        className="bg-white text-purple-700 px-4 py-2 rounded shadow hover:bg-purple-100 transition-all"
      >
        Upload File
      </button>
      {result && <p className="mt-6">{result}</p>}
    </div>
  );
}