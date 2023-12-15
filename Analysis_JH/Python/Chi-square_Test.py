import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from scipy.stats import chi2_contingency
import numpy as np

# CSV 파일 경로
csv_file_path = 'test.csv'

# CSV 파일을 pandas DataFrame으로 읽기
df = pd.read_csv(csv_file_path)

# 히트맵을 그리기 위해 P-value를 저장할 데이터프레임 생성
p_values = pd.DataFrame(index=df.columns, columns=df.columns)

# 모든 컬럼 쌍에 대해 카이제곱 검정 수행 및 P-value 기록
for col1 in df.columns:
    for col2 in df.columns:
        observed_data = pd.crosstab(df[col1], df[col2])
        chi2, p, _, _ = chi2_contingency(observed_data)
        p_values.at[col1, col2] = p

# 대칭 부분을 가리기 위한 마스크 생성
mask = np.triu(np.ones_like(p_values, dtype=bool))

# 히트맵 시각화
plt.figure(figsize=(12, 10))
sns.heatmap(p_values.astype(float), annot=True, cmap="coolwarm", linewidths=.5, cbar=True, mask=mask)

plt.title("P-value")
plt.show()
