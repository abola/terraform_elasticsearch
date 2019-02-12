# Google Pub/Sub Example

請點以下圖示，開啟您的 Google cloud shell
<a href="https://console.cloud.google.com/cloudshell/editor?shellonly=true" target="_blank"><img src="https://gstatic.com/cloudssh/images/open-btn.png" alt="在 Cloud Shell 中開啟"/></a>


## 前置作業

請先確認以下項目，以確保後續的動作順利進行

## 取得原始碼 

你可以直接[下載原始碼]或使用 git

### 使用 git 下載原始碼 

```bash
git clone some where
```

### 進入專案目錄

```bash
cd examples_pubsub
```

### 在 cloud shell 中開啟本教程 (optional)

```bash 
cloudshell launch-tutorial README.md
```

## 設定環境變數

你會在本頁中，設定後續動作所需的環境變數

### 產生亂數序號

亂數產生一組序號，防止範例執行過程中出現衝突

```bash
export RND_KEY=$(printf %05d $((RANDOM % 100000)))
```

### 設定各項環境變數名稱

執行以下指令，會設定本教程中，所有使用到的環境變數

```bash
export $(grep -v '^#' environments | xargs)
```

詳細的內容，您可以參考檔案[environments]

```
# frontend image 名稱
FRONTEND_IMAGE=frontend-image-${RND_KEY}
# backend image 名稱
BACKEND_IMAGE=backend-image-${RND_KEY}
# 示範用專案ID 
GCP_PROJECT_ID=pubsub-projectid-${RND_KEY}
# GKE 名稱 
GCP_GKE_NAME=pubsub-k8s-name-${RND_KEY}

```

## 產生 frontend image

本步驟會將 frontend 端的程式，打包成 docker image 並上傳至 GCR

### 

```bash
docker build \
  -t gcr.io/${GCP_PROJECT_ID}/${FRONTEND_IMAGE}
```

## 完成

最後請記得，刪除本次練習的專案，以節省費用

```bash
gcloud projects delete ${GCP_PROJECT_ID}
```

[cloud shell]: (https://console.cloud.google.com/cloudshell/editor?shellonly=true)
[environments]: (./environments)
[下載原始碼]: (http://www.google.com)
