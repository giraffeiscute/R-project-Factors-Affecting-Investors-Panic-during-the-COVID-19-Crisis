English version underneath
# 新冠疫情下投資人的恐慌指標分析 (VIX)
本專案旨在探討 COVID-19 疫情期間，全球金融市場上反映投資人恐慌程度的波動率指數（VIX）的變化趨勢，並分析疫情與 VIX 之間的關聯性。研究透過視覺化圖表與機器學習模型，提供疫情對市場情緒影響的量化觀察與預測能力驗證。

## 專案背景
研究動機：新冠疫情對全球經濟與金融市場造成巨大衝擊，VIX 指數作為衡量市場恐慌的重要指標，其變動是否與疫情資訊同步、甚至具有預測能力，是本研究的核心問題。

研究目的：探討疫情資訊發布對 VIX 的影響，並分析在特定事件（如 WHO 宣布疫情為全球大流行）前後 VIX 的異動情形。


## 研究亮點
1. 綜合統計分析與機器學習技術，雙重驗證疫情對市場情緒的影響

2. 使用Lasso 與 Ridge regression 模型提供預測角度，並考慮特徵選擇與過擬合問題

3. 應用PCA 提供降維分析結果，協助萃取重要變數與潛在解釋因子

## 機器學習應用
### Lasso 與 Ridge Regression 模型比較
1. 應用 Lasso 與 Ridge Regression 分析 COVID-19 疫情數據對 VIX 的預測能力

2. 比較兩種回歸模型在我們資料情境中對「過度擬合」（overfitting）問題的處理效果

3. 評估模型解釋力與穩健性，確定較適合的預測方法

### 主成分分析（PCA）
1. 對高維疫情數據（如新增病例、死亡人數、疫苗施打率等）進行 PCA 降維處理

2. 萃取具有代表性的主成分特徵

3. 探討這些關鍵特徵與 VIX 之間的潛在關聯性

4. 理解疫情各項指標如何共同影響投資人情緒

## 分析方法與技術
### 傳統統計與視覺化分析
1. 使用 VIX 指數日資料 進行時序圖觀察

2. 收錄重大疫情新聞事件時間點，對應 VIX 變化

3. 整理疫情初期與後期 VIX 水準變化趨勢

## 觀看完整報告與實驗結果
使用google或任意瀏覽器開啟檔案 [楊致遠__林羽霈_新冠疫情下投資人的恐慌指標(VIX).html](https://github.com/giraffeiscute/R-project-Factors-Affecting-Investors-Panic-during-the-COVID-19-Crisis/blob/main/%E6%A5%8A%E8%87%B4%E9%81%A0__%E6%9E%97%E7%BE%BD%E9%9C%88_%E6%96%B0%E5%86%A0%E7%96%AB%E6%83%85%E4%B8%8B%E6%8A%95%E8%B3%87%E4%BA%BA%E7%9A%84%E6%81%90%E6%85%8C%E6%8C%87%E6%A8%99(VIX).html) 即可觀看完整實驗結果圖以及實驗報告


## 參考資料
Andrzej, M. & Waldemar, R. (1993). Principal components analysis (PCA). Journal of Computers & Geosciences, Vol. 19, (March), pp. 303-342.
Melkumova, L. E. & Shatskikh, S. Ya. (2017). Comparing Ridge and LASSO estimators for data analysis. Journal of Procedia Engineering, Vol. 201, pp. 746-755


## 作者
楊致遠 Chih-Yuan Yang

林羽霈 Yu-Pei Lin

****

# Analysis of Investor Panic Index (VIX) During the COVID-19 Pandemic
This project explores the trend of the Volatility Index (VIX), which reflects investor panic in global financial markets during the COVID-19 pandemic. The study investigates the correlation between pandemic-related developments and fluctuations in VIX. Through visual analytics and machine learning models, this research provides a quantitative examination of the impact of the pandemic on market sentiment and validates the predictive power of COVID-19 data on investor behavior.

## Project Background
Motivation: The COVID-19 pandemic severely impacted the global economy and financial markets. As a key indicator of market fear, the VIX is central to this research, which aims to determine whether its fluctuations align with the release of pandemic-related information and whether it holds predictive value.

Objective: To analyze how the release of pandemic-related news influenced the VIX, especially surrounding key events such as the WHO's declaration of a global pandemic.

## Research Highlights
Combined use of statistical analysis and machine learning techniques to validate the impact of the pandemic on investor sentiment.

Applied Lasso and Ridge Regression models to predict VIX levels while addressing feature selection and overfitting concerns.

Used Principal Component Analysis (PCA) to perform dimensionality reduction, extracting key variables and uncovering latent explanatory factors.

## Machine Learning Applications
### Comparison of Lasso and Ridge Regression Models
1. Applied Lasso and Ridge Regression to analyze the predictive power of COVID-19 data on VIX.

2. Compared the two models' effectiveness in handling overfitting under our dataset and context.

3. Evaluated model interpretability and robustness to determine the better fit for our prediction task.

### Principal Component Analysis (PCA)
1. Performed dimensionality reduction on high-dimensional COVID-19 data (e.g., new cases, death counts, vaccination rates).

2. Extracted representative principal components.

3. Investigated the latent relationships between these key features and VIX.

4. Explored how multiple pandemic indicators jointly influence investor sentiment.

## Analytical Methods and Techniques
### Traditional Statistical and Visual Analysis
1. Used daily VIX index data to create time-series visualizations.

2. Annotated significant COVID-19 news events on the timeline to examine corresponding VIX fluctuations.

3. Summarized the trend differences in VIX levels between the early and later stages of the pandemic.

## View Full Report and Results
To view the full experimental results and report with all visualizations, open the file
[楊致遠__林羽霈_新冠疫情下投資人的恐慌指標(VIX).html](https://github.com/giraffeiscute/R-project-Factors-Affecting-Investors-Panic-during-the-COVID-19-Crisis/blob/main/%E6%A5%8A%E8%87%B4%E9%81%A0__%E6%9E%97%E7%BE%BD%E9%9C%88_%E6%96%B0%E5%86%A0%E7%96%AB%E6%83%85%E4%B8%8B%E6%8A%95%E8%B3%87%E4%BA%BA%E7%9A%84%E6%81%90%E6%85%8C%E6%8C%87%E6%A8%99(VIX).html)
in Google Chrome or any modern web browser.

## References
Andrzej, M. & Waldemar, R. (1993). Principal Components Analysis (PCA). Journal of Computers & Geosciences, Vol. 19 (March), pp. 303–342.

Melkumova, L. E. & Shatskikh, S. Ya. (2017). Comparing Ridge and LASSO Estimators for Data Analysis. Procedia Engineering, Vol. 201, pp. 746–755.

## Authors
Chih-Yuan Yang

Yu-Pei Lin
