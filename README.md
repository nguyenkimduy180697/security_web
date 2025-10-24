
# Git & OpenProject Workflow (Tối Ưu Theo EPIC)

## 🔹 1. Trước Khi Bắt Đầu Làm Việc
```bash
git checkout develop
git pull origin develop
```

## 🔹 2. Tạo Nhánh Theo EPIC / Tính Năng Chính
> Thay vì mỗi task một nhánh, hãy tạo nhánh theo EPIC (OpenProject)

```bash
git checkout -b feature/ten-epic
git push --set-upstream origin feature/ten-epic
```

### ✅ Ví dụ tên nhánh:
- `feature/payment-module`
- `feature/admin-dashboard`
- `bugfix/export-report-error`

---

## 🔹 3. Làm Việc Với Từng Task Trong EPIC

- Vẫn làm việc trên nhánh EPIC đã tạo
- Ghi rõ `{OP#task_id}` trong commit message để liên kết với OpenProject

```bash
git add .
git commit -m "{OP#5678} BE: Optimize user query in report"
git push
```

> Gợi ý:  
> - `{OP#id} FE: Style login page`  
> - `{OP#id} BE: Refactor invoice logic`

---

## 🔹 4. Khi Hoàn Thành Tính Năng / EPIC → Tạo Merge Request
- MR từ nhánh `feature/ten-epic` → `develop`
- Gán người review, milestone, và mô tả rõ các task đã xử lý trong EPIC

---

## 🔹 5. Đối Với Công Việc Không Thuộc Task Nào Cụ Thể
- Tạo task `Research / Support / Helper / Khác` trong OpenProject
- Ghi rõ commit như sau:

```bash
git commit -m "{OP#1234} Research: Investigate job queue performance"
```

---

## 🔒 Lưu Ý Bắt Buộc
- ❌ Không được code trực tiếp ở `develop` hoặc `main`
- ❌ Không được tự ý tạo branch ngoài các EPIC đã có
- ✅ Mỗi commit **phải có tag `{OP#id}`**
