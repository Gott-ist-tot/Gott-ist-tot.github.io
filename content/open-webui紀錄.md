---
draft: true
title: open-webui紀錄
date: 2025-02-09 21:41:06
tags:
---
# Open WebUI 與 Docker 部署及進階功能解析

本文詳細介紹了 Open WebUI 的核心功能、進階擴展機制（包括工具、函數與流水線）以及如何利用 Docker 快速部署與啟動 Open WebUI。透過本篇文章，你可以構建一個功能豐富且易於管理的本地大模型平台，並探索與各種大型語言模型 (LLM) 互動的多種方式。

## 目錄

- [Open WebUI 與 Docker 部署及進階功能解析](#open-webui-與-docker-部署及進階功能解析)
  - [目錄](#目錄)
  - [一、簡介](#一簡介)
  - [二、Open WebUI 的基礎功能](#二open-webui-的基礎功能)
    - [2.1 上傳文件與 RAG 系統](#21-上傳文件與-rag-系統)
    - [2.2 語音與文字溝通](#22-語音與文字溝通)
    - [2.3 Web 搜索功能](#23-web-搜索功能)
  - [三、進階 Hook 機制](#三進階-hook-機制)
    - [3.1 Tool（工具）](#31-tool工具)
    - [3.2 Function（函數）](#32-function函數)
    - [3.3 Pipeline（流水線）](#33-pipeline流水線)
  - [四、利用 Docker 安裝與部署 Open WebUI](#四利用-docker-安裝與部署-open-webui)
    - [4.1 前置準備](#41-前置準備)
    - [4.2 拉取 Docker 映像](#42-拉取-docker-映像)
    - [4.3 啟動容器](#43-啟動容器)
    - [4.4 GPU 支援（選用）](#44-gpu-支援選用)
    - [4.5 驗證與使用](#45-驗證與使用)
    - [4.6 引入pipeline](#46-引入pipeline)
  - [五、功能探索與進階應用](#五功能探索與進階應用)
  - [六、總結](#六總結)
  - [參考資料](#參考資料)

---

## 一、簡介

Open WebUI 是一個自托管且使用者友好的 Web 介面，專為大型語言模型（LLM）的管理與互動而設計。它支援多種模型運行環境，包括 Ollama 以及與 OpenAI 兼容的 API。其直觀的介面設計靈感來源於 ChatGPT，不論在桌面端或移動設備上，都能提供一致且流暢的使用體驗。

---

## 二、Open WebUI 的基礎功能

### 2.1 上傳文件與 RAG 系統

- **建立 RAG 系統：**  
  使用者可透過上傳文件來構建個人知識庫，並利用檢索增強生成（Retrieval-Augmented Generation，RAG）技術提高對話回應的準確度與效率。

### 2.2 語音與文字溝通

- **多模態交互：**  
  平台不僅支援傳統的文字對話，還能進行語音輸入與回覆，讓使用者體驗更豐富的互動方式。

### 2.3 Web 搜索功能

- **即時網絡查詢：**  
  內建網絡搜尋功能可直接抓取並整合網頁內容，使用戶在對話中能參考最新資訊，進而提升互動效果。

---

## 三、進階 Hook 機制

### 3.1 Tool（工具）

- **自定義擴展：**  
  使用者可編寫自定義工具（Tool），例如天氣查詢、計算器等，並將其與 LLM 模型整合，提供額外輔助功能。

### 3.2 Function（函數）

- **系統層級規則與安全過濾：**  
  函數主要用於定義系統層面的規則，如過濾惡意訊息、記錄 token 等，確保系統安全穩定運行。

### 3.3 Pipeline（流水線）

- **流程定製與自動化：**  
  Pipeline 允許使用者將多個工具或函數組合成一個定製化工作流程。例如，可建立一個數學題解答的流水線，從模型生成思考過程、執行 Python 代碼到返回最終答案，實現全流程自動化。

---

## 四、利用 Docker 安裝與部署 Open WebUI

### 4.1 前置準備

- **安裝 Docker：**  
  請至 [Docker 官網](https://www.docker.com/) 下載並安裝適用於你作業系統的 Docker Desktop（或 Linux 版 Docker）。

### 4.2 拉取 Docker 映像

```bash
docker pull ghcr.io/open-webui/open-webui:main
```

### 4.3 啟動容器

```bash
docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:main
```

### 4.4 GPU 支援（選用）

```bash
docker run -d -p 3000:8080 --gpus all --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui --restart always ghcr.io/open-webui/open-webui:cuda
```

### 4.5 驗證與使用

1. 在瀏覽器中輸入 `http://localhost:3000` 開啟 Open WebUI 登入頁面。
2. 根據提示註冊管理員帳號。
3. 登入後即可選擇模型、上傳文件建立 RAG 系統、進行語音或文字對話，以及使用 Web 搜索功能查詢資訊。
### 4.6 引入pipeline 
```bash
docker run -d -p 9099:9099 --add-host=host.docker.internal:host-gateway -v pipelines:/app/pipelines --name pipelines --restart always ghcr.io/open-webui/pipelines:main
``` 
1. 引入pipeline 模塊
2. 在管理員面板中的連線中新增 URL: http://localhost:9099 API:0p3n-w3bu!
3. 成功!

---

## 五、功能探索與進階應用

- **聊天記錄管理**
- **自定義模型配置**
- **多模態與協作聊天**
- **進階流水線應用**

---

## 六、總結

本文詳細介紹了 Open WebUI 的核心功能及其進階擴展機制，並以 Docker 為例說明了如何快速部署與啟動該系統。希望本文能幫助你順利部署並探索 Open WebUI 的強大功能，進一步提升在 AI 模型管理與應用方面的效率與體驗。

---

## 參考資料

- [Docker 官方網站](https://www.docker.com/)
- [Open WebUI 官方文檔](https://github.com/open-webui/open-webui)
- [Open WebUI 相關博客與技術文章]

