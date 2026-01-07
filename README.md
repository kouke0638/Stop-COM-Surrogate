# Stop COM Surrogate (dllhost.exe)

[English](#english) | [繁體中文](#繁體中文)

## English

A tiny Windows batch script that self-elevates (UAC prompt once) and stops **COM Surrogate** by killing `dllhost.exe`.

> **⚠️ WARNING**
> `dllhost.exe` is used by Windows to host COM components (e.g., thumbnail/preview handlers).
> Killing it may temporarily break thumbnails/previews or other COM-hosted features. Windows/apps may start it again automatically.

### What it does

- Checks if it's running as Administrator.
- If not, re-launches itself with `RunAs` (shows the UAC prompt).
- Runs `taskkill /F /IM dllhost.exe`.

### Usage

1. Download this repo (or clone).
2. Run: `scripts\stop_com_surrogate.bat`
3. Approve the UAC prompt.

### Extra tool (optional)

- `scripts\restart_explorer.bat`: restarts Windows Explorer, which often fixes hangs caused by thumbnail/preview chains without killing all `dllhost.exe`.

### When you should use it

- When File Explorer is frozen due to preview/thumbnail handlers.
- When `COM Surrogate` is stuck consuming CPU/RAM and you want a quick reset.

---

## 繁體中文

這是一個微型的 Windows 批次檔 (.bat)，它會自動提權（僅需一次 UAC 確認）並透過強制結束 `dllhost.exe` 來停止 **COM Surrogate**。

> **⚠️ 警告**
> `dllhost.exe` 是 Windows 用來主控 COM 元件（例如：縮圖、預覽處理常式）的程序。
> 強制結束它可能會暫時導致縮圖或預覽功能失效。Windows 或其他應用程式通常會自動重新啟動它。

### 功能說明

- 檢查目前是否以系統管理員身分執行。
- 如果不是，會使用 `RunAs` 重新啟動自己（此時會跳出 UAC 提示）。
- 執行 `taskkill /F /IM dllhost.exe` 強制結束程序。

### 使用方法

1. 下載此專案（或 Clone）。
2. 執行：`scripts\stop_com_surrogate.bat`
3. 在 UAC 提示視窗點選「是」。

### 額外工具（選用）

- `scripts\restart_explorer.bat`：重新啟動 Windows 檔案總管 (Explorer)。
  - 這通常能解決因縮圖或預覽卡住造成檔案總管死當的問題，而不必殺死所有 `dllhost.exe`。

### 適用時機

- 當檔案總管因為預覽圖片或影片縮圖而卡死時。
- 當 `COM Surrogate` 程序佔用過多 CPU 或記憶體，而你想要快速重置它時。

## License

MIT
