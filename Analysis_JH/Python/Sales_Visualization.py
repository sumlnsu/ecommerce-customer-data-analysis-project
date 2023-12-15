import pandas as pd
import matplotlib.pyplot as plt

# CSV 파일 경로
csv_file_path = 'ARPPU.csv'  # 실제 파일 경로로 변경해주세요

tmp='ARPPU'

# CSV 파일을 pandas DataFrame으로 읽기
df = pd.read_csv(csv_file_path, parse_dates=['date'])

# 매출액이 최대값과 최소값을 갖는 행 추출
max_sales_row = df[df[tmp] == df[tmp].max()]
min_sales_row = df[df[tmp] == df[tmp].min()]


# 그래프 그리기
plt.figure(figsize=(10, 6))
plt.plot(df['date'], df[tmp], label=tmp)
plt.scatter(max_sales_row['date'], max_sales_row[tmp], color='red', label=f'Max_{tmp}')
plt.scatter(min_sales_row['date'], min_sales_row[tmp], color='blue', label=f'Min_{tmp}')

# 매년 2월에 해당하는 데이터 scatter plot으로 표시 (초록색)
# for year in df['date'].dt.year.unique():
#     feb_data = df[(df['date'].dt.year == year) & (df['date'].dt.month == 2)]
#     plt.scatter(feb_data['date'], feb_data[tmp], color='green', label=f'{year}-02', alpha=0.7)



# 최대 매출액에 대한 텍스트 표시
for _, row in max_sales_row.iterrows():
    plt.text(row['date'], row[tmp]+1, f"Max\nDate: {row['date']}\n{tmp}: {row[tmp]}", color='red') ## 2번째 파라미터로 텍스트 y축 변경

# 최소 매출액에 대한 텍스트 표시
for _, row in min_sales_row.iterrows():
    plt.text(row['date'], row[tmp], f"Min\nDate: {row['date']}\n{tmp}: {row[tmp]}", color='blue')

# 그래프 스타일링
plt.title('')
plt.xlabel('Date')
plt.ylabel(tmp)
plt.legend()
plt.show()
