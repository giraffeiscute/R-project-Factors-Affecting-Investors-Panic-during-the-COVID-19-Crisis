# 新冠疫情下投資人的恐慌指標分析 (VIX)
本專案旨在探討 COVID-19 疫情期間，全球金融市場上反映投資人恐慌程度的波動率指數（VIX）的變化趨勢，並分析疫情與 VIX 之間的關聯性。研究透過視覺化圖表與機器學習模型，提供疫情對市場情緒影響的量化觀察與預測能力驗證。

## 專案背景
研究動機：新冠疫情對全球經濟與金融市場造成巨大衝擊，VIX 指數作為衡量市場恐慌的重要指標，其變動是否與疫情資訊同步、甚至具有預測能力，是本研究的核心問題。

研究目的：探討疫情資訊發布對 VIX 的影響，並分析在特定事件（如 WHO 宣布疫情為全球大流行）前後 VIX 的異動情形。


## 研究亮點
綜合統計分析與機器學習技術，雙重驗證疫情對市場情緒的影響

Lasso 與 Ridge regression 模型提供預測角度，並考慮特徵選擇與過擬合問題

PCA 提供降維分析結果，協助萃取重要變數與潛在解釋因子

## 機器學習應用
### Lasso 與 Ridge Regression 模型比較
1.應用 Lasso 與 Ridge Regression 分析 COVID-19 疫情數據對 VIX 的預測能力

2.比較兩種回歸模型在我們資料情境中對「過度擬合」（overfitting）問題的處理效果

3.評估模型解釋力與穩健性，確定較適合的預測方法

### 主成分分析（PCA）
1. 對高維疫情數據（如新增病例、死亡人數、疫苗施打率等）進行 PCA 降維處理

2. 萃取具有代表性的主成分特徵

3. 探討這些關鍵特徵與 VIX 之間的潛在關聯性

4. 理解疫情各項指標如何共同影響投資人情緒

## 分析方法與技術
### 傳統統計與視覺化分析
使用 VIX 指數日資料 進行時序圖觀察

收錄 重大疫情新聞事件時間點，對應 VIX 變化

整理疫情初期與後期 VIX 水準變化趨勢

## 觀看完整報告與實驗結果
使用google或任意瀏覽器開啟檔案 楊致遠__林羽霈_新冠疫情下投資人的恐慌指標(VIX).html 即可觀看完整實驗結果圖以及實驗報告


## 研究亮點
綜合統計分析與機器學習技術，雙重驗證疫情對市場情緒的影響

Lasso 與 Ridge regression 模型提供預測角度，並考慮特徵選擇與過擬合問題

PCA 提供降維分析結果，協助萃取重要變數與潛在解釋因子

## 參考資料
Andrzej, M. & Waldemar, R. (1993). Principal components analysis (PCA). Journal of Computers & Geosciences, Vol. 19, (March), pp. 303-342.
Melkumova, L. E. & Shatskikh, S. Ya. (2017). Comparing Ridge and LASSO estimators for data analysis. Journal of Procedia Engineering, Vol. 201, pp. 746-755


## 作者
楊致遠 Chih-Yuan Yang

林羽霈 Yu-Pei Lin
