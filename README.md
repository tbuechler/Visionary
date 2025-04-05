# Visionary Upload App

[![CI](https://github.com/tbuechler/Visionary/actions/workflows/ci.yml/badge.svg)](https://github.com/tbuechler/Visionary/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A professional full-stack app for uploading files using:

- ⚙️ **FastAPI** for the backend
- 🌐 **Next.js (React)** with file upload form
- 🎨 Custom styling and animations
- 🧪 Virtualenv support for backend

## 🚀 Quickstart

### Backend

```bash
cd backend
../setup_environment.sh
uvicorn visionary.main:app --reload
```

### Frontend

```bash
cd frontend
npm install
npm run dev
```

Then go to [http://localhost:3000](http://localhost:3000) and try uploading a file!