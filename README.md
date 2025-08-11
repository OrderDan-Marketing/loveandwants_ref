# Love and Wants 跳轉頁面

一個智能的網頁跳轉工具，專為處理不同瀏覽器環境而設計，特別針對社交媒體應用內瀏覽器進行優化。

## 功能特色

- **智能瀏覽器檢測**：自動識別用戶使用的瀏覽器類型和環境
- **應用內瀏覽器處理**：針對 Instagram、Facebook 等社交媒體應用內瀏覽器進行特殊處理
- **跨平台支援**：支援 iOS、Android 和桌面平台
- **視覺化載入效果**：提供友好的載入動畫和提示文字
- **響應式設計**：適配各種設備螢幕尺寸

## 使用方式

### 直接使用
將 `index.html` 部署到你的網頁伺服器，用戶訪問時將自動跳轉至 `https://loveandwants.com/`。

### 自定義目標網址
修改 JavaScript 代碼中的 URL：

```javascript
const url = 'https://your-target-website.com/';
```

## 技術實現

### 瀏覽器檢測邏輯

1. **應用內瀏覽器檢測**
   - Instagram 應用內瀏覽器
   - Facebook 應用內瀏覽器（FBAN/FBAV）

2. **平台特定處理**
   - **iOS 設備**：使用 `x-safari-https://` 協議在 Safari 中開啟
   - **Android 設備**：使用 Intent URL 在預設瀏覽器中開啟
   - **桌面平台**：直接跳轉

### 跳轉時序

- **應用內瀏覽器**：1秒後執行外部瀏覽器開啟
- **一般瀏覽器**：1.5秒後直接跳轉

## 檔案結構

```
loveandwants_ref/
├── index.html          # 主要跳轉頁面
├── 404.html           # 錯誤頁面
├── _headers           # HTTP 標頭設定
├── _redirects         # 重定向規則
├── robots.txt         # 搜尋引擎爬蟲設定
└── README.md          # 專案說明文件
```

## 部署說明

### Netlify 部署
1. 將專案推送至 GitHub
2. 連接 Netlify 帳戶
3. 選擇此專案進行自動部署
4. `_headers` 和 `_redirects` 檔案將自動生效

### 其他平台
- 確保伺服器支援 HTML5 History API
- 配置適當的 HTTP 標頭（參考 `_headers` 檔案）

## 自定義選項

### 修改載入文字
```html
<div class="loading">您的自定義載入文字...</div>
```

### 調整載入動畫
修改 CSS 中的 `.spinner` 樣式來自定義載入動畫效果。

### 變更跳轉延遲
```javascript
// 應用內瀏覽器延遲（毫秒）
setTimeout(openInExternalBrowser, 1000);

// 一般瀏覽器延遲（毫秒）
setTimeout(() => {
    window.location.href = 'https://loveandwants.com/';
}, 1500);
```

## 瀏覽器相容性

- ✅ Chrome (所有版本)
- ✅ Safari (iOS/macOS)
- ✅ Firefox
- ✅ Edge
- ✅ 移動端瀏覽器
- ✅ 社交媒體應用內瀏覽器

## 注意事項

1. **隱私考量**：此頁面不收集任何用戶數據
2. **性能優化**：頁面載入快速，資源占用極小
3. **SEO 友好**：包含適當的 meta 標籤和 robots.txt
4. **無障礙設計**：符合網頁無障礙標準

## 維護與更新

定期檢查目標網站的可用性，確保跳轉功能正常運作。如需更新目標 URL，只需修改 JavaScript 中的相關變數即可。

## 授權

本專案採用 MIT 授權條款。

## 聯絡資訊

如有問題或建議，請透過 GitHub Issues 聯繫。
