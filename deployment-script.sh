#!/bin/bash

# n8n Template Finder - Zeabur 一鍵部署腳本
# 此腳本將自動建立專案結構並準備部署

set -e  # 發生錯誤時停止執行

# 顏色定義
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# 專案配置
PROJECT_NAME="n8n-template-finder"
PROJECT_DESCRIPTION="n8n 官方模板查詢器 - 快速搜尋 3000+ 工作流模板"
GITHUB_REPO="https://github.com/your-username/${PROJECT_NAME}.git"

echo -e "${PURPLE}🚀 n8n Template Finder - Zeabur 部署工具${NC}"
echo -e "${CYAN}================================================${NC}"
echo ""

# 檢查依賴
echo -e "${BLUE}📦 檢查系統依賴...${NC}"

# 檢查 Git
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git 未安裝，請先安裝 Git${NC}"
    exit 1
fi

# 檢查 Node.js (可選)
if command -v node &> /dev/null; then
    echo -e "${GREEN}✅ Node.js 已安裝: $(node --version)${NC}"
else
    echo -e "${YELLOW}⚠️  Node.js 未安裝，建議安裝以便本地預覽${NC}"
fi

echo ""

# 建立專案目錄
echo -e "${BLUE}📁 建立專案目錄...${NC}"
if [ -d "$PROJECT_NAME" ]; then
    read -p "專案目錄已存在，是否要刪除並重新建立？(y/N): " confirm
    if [[ $confirm =~ ^[Yy]$ ]]; then
        rm -rf "$PROJECT_NAME"
        echo -e "${GREEN}✅ 已刪除舊專案目錄${NC}"
    else
        echo -e "${YELLOW}❌ 取消部署${NC}"
        exit 0
    fi
fi

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

echo -e "${GREEN}✅ 專案目錄建立完成: $(pwd)${NC}"
echo ""

# 建立 robots.txt
echo -e "${BLUE}🤖 建立 robots.txt...${NC}"
cat > robots.txt << 'EOF'
User-agent: *
Allow: /
Disallow: /api/
Disallow: /_redirects
Disallow: /_headers
Disallow: /config/

# 網站地圖
Sitemap: https://your-domain.zeabur.app/sitemap.xml

# 快取指示
Crawl-delay: 1
EOF

# 建立 sitemap.xml
echo -e "${BLUE}🗺️  建立 sitemap.xml...${NC}"
cat > sitemap.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://your-domain.zeabur.app/</loc>
    <lastmod>2025-01-07</lastmod>
    <changefreq>daily</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://your-domain.zeabur.app/?category=ai</loc>
    <lastmod>2025-01-07</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>https://your-domain.zeabur.app/?category=communication</loc>
    <lastmod>2025-01-07</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>
  <url>
    <loc>https://your-domain.zeabur.app/?category=business</loc>
    <lastmod>2025-01-07</lastmod>
    <changefreq>weekly</changefreq>
    <priority>0.8</priority>
  </url>
</urlset>
EOF

# 建立 manifest.json
echo -e "${BLUE}📱 建立 manifest.json (PWA 支援)...${NC}"
cat > manifest.json << 'EOF'
{
  "name": "n8n Template Finder",
  "short_name": "n8n Templates",
  "description": "快速搜尋和發現 3000+ n8n 工作流模板",
  "start_url": "/",
  "display": "standalone",
  "orientation": "portrait-primary",
  "theme_color": "#667eea",
  "background_color": "#ffffff",
  "categories": ["productivity", "utilities", "developer"],
  "lang": "zh-TW",
  "scope": "/",
  "icons": [
    {
      "src": "/favicon.ico",
      "sizes": "16x16 32x32",
      "type": "image/x-icon"
    }
  ],
  "shortcuts": [
    {
      "name": "AI 模板",
      "url": "/?category=ai"
    },
    {
      "name": "LINE 模板", 
      "url": "/?search=line"
    },
    {
      "name": "Gmail 模板",
      "url": "/?search=gmail"
    }
  ]
}
EOF

# 建立簡單的 favicon.ico (base64 編碼)
echo -e "${BLUE}🎨 建立 favicon.ico...${NC}"
# 這裡應該放置實際的 favicon.ico 檔案
echo "建議您替換 favicon.ico 為您的自訂圖示"

echo -e "${GREEN}✅ 基本檔案建立完成${NC}"
echo ""

# 提示用戶複製主要檔案
echo -e "${YELLOW}⚠️  重要提醒：${NC}"
echo -e "${CYAN}請手動複製以下檔案到專案目錄：${NC}"
echo "1. index.html     - 主要網頁檔案"
echo "2. 404.html       - 錯誤頁面"
echo "3. _redirects     - 重新導向規則"
echo "4. _headers       - HTTP 標頭設定"
echo ""

read -p "已複製所有必要檔案了嗎？(y/N): " files_ready
if [[ ! $files_ready =~ ^[Yy]$ ]]; then
    echo -e "${YELLOW}請先複製檔案後再繼續${NC}"
    exit 0
fi

# 初始化 Git
echo -e "${BLUE}📝 初始化 Git repository...${NC}"
git init
git add .
git commit -m "Initial commit: n8n template finder

- 新增主要查詢器功能
- 支援分類和搜尋
- 整合 n8n 官方 API
- Zeabur 靜態部署優化
- SEO 和 PWA 支援"

echo -e "${GREEN}✅ Git repository 初始化完成${NC}"
echo ""

# GitHub 設定
echo -e "${BLUE}🌐 GitHub Repository 設定${NC}"
read -p "是否要建立 GitHub repository？(y/N): " create_github
if [[ $create_github =~ ^[Yy]$ ]]; then
    read -p "請輸入您的 GitHub 用戶名: " github_username
    read -p "請輸入 repository 名稱 (預設: ${PROJECT_NAME}): " repo_name
    repo_name=${repo_name:-$PROJECT_NAME}
    
    github_url="https://github.com/${github_username}/${repo_name}.git"
    
    echo -e "${CYAN}請在 GitHub 上建立新 repository: ${github_url}${NC}"
    echo -e "${CYAN}然後執行以下命令：${NC}"
    echo ""
    echo "git remote add origin ${github_url}"
    echo "git branch -M main"
    echo "git push -u origin main"
    echo ""
    
    read -p "已建立 GitHub repository 了嗎？(y/N): " github_ready
    if [[ $github_ready =~ ^[Yy]$ ]]; then
        git remote add origin "$github_url"
        git branch -M main
        
        # 嘗試推送到 GitHub
        if git push -u origin main; then
            echo -e "${GREEN}✅ 程式碼已成功推送到 GitHub${NC}"
        else
            echo -e "${YELLOW}⚠️  推送失敗，請檢查 GitHub repository 設定${NC}"
        fi
    fi
fi

echo ""

# Zeabur 部署指引
echo -e "${PURPLE}🚀 Zeabur 部署步驟：${NC}"
echo -e "${CYAN}================================================${NC}"
echo ""
echo "1. 🌐 前往 Zeabur Dashboard："
echo "   https://dash.zeabur.com"
echo ""
echo "2. 📝 建立新專案："
echo "   - 點擊 'Create Project'"
echo "   - 選擇合適的 region (建議選擇 Asia)"
echo ""
echo "3. 🔗 連接 GitHub："
echo "   - 點擊 'Deploy from GitHub'"
echo "   - 選擇您剛建立的 repository"
echo "   - Zeabur 會自動偵測為靜態網站"
echo ""
echo "4. ⚙️ 環境設定（可選）："
echo "   - 在 'Environment Variables' 中設定："
echo "     NODE_ENV=production"
echo "     SITE_NAME=n8n Template Finder"
echo ""
echo "5. 🌍 自訂域名（可選）："
echo "   - 在 'Domains' 中新增您的域名"
echo "   - 設定 DNS CNAME 記錄"
echo ""

# 本地預覽
echo -e "${BLUE}👀 本地預覽選項：${NC}"
echo ""
if command -v python3 &> /dev/null; then
    echo "使用 Python 預覽："
    echo "python3 -m http.server 8000"
    echo "然後開啟: http://localhost:8000"
elif command -v python &> /dev/null; then
    echo "使用 Python 預覽："
    echo "python -m http.server 8000"
    echo "然後開啟: http://localhost:8000"
fi

if command -v npx &> /dev/null; then
    echo ""
    echo "使用 Node.js 預覽："
    echo "npx serve . -l 8000"
    echo "然後開啟: http://localhost:8000"
fi

echo ""

# 完成訊息
echo -e "${GREEN}🎉 專案設定完成！${NC}"
echo -e "${CYAN}================================================${NC}"
echo ""
echo -e "${YELLOW}📋 檢查清單：${NC}"
echo "□ 已建立專案目錄和基本檔案"
echo "□ 已複製主要 HTML 檔案 (index.html, 404.html, _redirects, _headers)"
echo "□ 已初始化 Git repository"
echo "□ 已推送到 GitHub (如果選擇)"
echo "□ 準備在 Zeabur 上部署"
echo ""
echo -e "${BLUE}📚 有用的連結：${NC}"
echo "• Zeabur 文檔: https://zeabur.com/docs/zh-TW"
echo "• n8n 官方網站: https://n8n.io"
echo "• 專案 GitHub: ${github_url:-'設定中...'}"
echo ""
echo -e "${PURPLE}祝您部署順利！🚀${NC}"

# 最後提醒
echo ""
echo -e "${RED}⚠️  重要提醒：${NC}"
echo "1. 請確保所有檔案都已正確複製到專案目錄"
echo "2. 在 Zeabur 部署後，記得更新 sitemap.xml 中的域名"
echo "3. 建議設定 Google Analytics 追蹤使用情況"
echo "4. 定期更新模板內容以保持最新"