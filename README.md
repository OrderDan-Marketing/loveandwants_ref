# 🚀 n8n Template Finder

> 快速搜尋和發現 3000+ n8n 官方工作流模板

[![Deployment](https://img.shields.io/badge/deployment-Zeabur-blue)](https://zeabur.com)
[![Status](https://img.shields.io/badge/status-active-success)](https://your-domain.zeabur.app)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

## 📋 專案簡介

n8n Template Finder 是一個靜態網站應用程式，旨在幫助用戶快速搜尋和發現 n8n 官方模板庫中的自動化工作流模板。

### ✨ 主要功能

- 🔍 **智能搜尋** - 支援關鍵字搜尋和分類篩選
- 🏷️ **分類瀏覽** - 15+ 主要分類，包含 AI、通訊、商務等
- ⚡ **快速連結** - 直接跳轉到 n8n 官方模板頁面
- 📱 **響應式設計** - 完美支援手機、平板和桌面設備
- 🌐 **PWA 支援** - 可安裝為 Web App

### 🎯 主要分類

- 🤖 **AI & Machine Learning** - ChatGPT、文件摘要、圖像識別
- 💼 **Business Operations** - CRM、銷售流程、客戶管理
- 📞 **Communication** - LINE Bot、Slack、Gmail 自動化
- 📊 **Data Management** - Google Sheets、資料同步、分析
- 🛠️ **Developer Tools** - API 整合、Webhook 處理
- 📈 **Marketing** - 社群媒體、內容發布、SEO

## 🚀 部署到 Zeabur

### 方法一：GitHub 自動部署（推薦）

1. **Fork 此專案到您的 GitHub**
2. **登入 Zeabur Dashboard**
3. **建立新專案**
4. **選擇 GitHub Repository**
5. **Zeabur 自動偵測為靜態網站並部署**

### 方法二：直接上傳

1. **下載專案檔案**
2. **壓縮為 ZIP 檔案**
3. **在 Zeabur 選擇 "Upload ZIP"**
4. **配置部署設定**

## 📁 專案結構

```
n8n-template-finder/
├── index.html              # 主要網頁檔案
├── 404.html                # 自訂 404 錯誤頁面
├── _redirects              # Zeabur 重新導向規則
├── _headers                # HTTP 安全標頭設定
├── robots.txt              # SEO 爬蟲規則
├── sitemap.xml             # 網站地圖
├── manifest.json           # PWA 配置
├── favicon.ico             # 網站圖示
└── README.md               # 專案說明
```

## ⚙️ Zeabur 配置說明

### 重新導向規則 (_redirects)

- 支援短網址功能（如 `/ai` → `/?category=ai`）
- 外部連結重導向（如 `/official` → `https://n8n.io/workflows/`）
- SPA 路由支援

### 安全標頭 (_headers)

- 內容安全政策 (CSP)
- XSS 防護
- 點擊劫持防護
- CORS 設定
- 快取優化

### SEO 優化

- 搜索引擎友好的 URL 結構
- 完整的 meta 標籤
- 結構化資料標記
- 網站地圖自動生成

## 🔧 客製化

### 修改網站資訊

編輯 `index.html` 中的以下部分：

```html
<!-- 網站標題 -->
<title>您的網站標題</title>

<!-- 網站描述 -->
<meta name="description" content="您的網站描述">

<!-- 品牌資訊 -->
<h1>您的品牌名稱</h1>
```

### 新增自訂域名

1. 在 Zeabur Dashboard 中新增域名
2. 設定 DNS CNAME 記錄
3. 更新 `_headers` 和 `sitemap.xml` 中的網址

### 整合 Google Analytics

在 `index.html` 的 `<head>` 中新增：

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_TRACKING_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_TRACKING_ID');
</script>
```

## 🔗 相關連結

- [n8n 官方網站](https://n8n.io/)
- [n8n 模板庫](https://n8n.io/workflows/)
- [n8n 文檔](https://docs.n8n.io/)
- [Zeabur 文檔](https://zeabur.com/docs)

## 📄 授權條款

本專案採用 MIT 授權條款。詳見 [LICENSE](LICENSE) 檔案。

## 🤝 貢獻

歡迎提交 Issue 和 Pull Request 來改善此專案！

### 開發環境設定

```bash
# 本地預覽
python -m http.server 8000
# 或
npx serve .
```

### 提交規範

- 使用描述性的 commit 訊息
- 遵循現有的程式碼風格
- 測試所有功能正常運作

## 📧 聯絡資訊

如有任何問題或建議，請透過以下方式聯絡：

- 📧 Email: your-email@example.com
- 💬 GitHub Issues: [專案 Issues 頁面](https://github.com/your-username/n8n-template-finder/issues)

---

⭐ 如果這個專案對您有幫助，請給我們一個 Star！