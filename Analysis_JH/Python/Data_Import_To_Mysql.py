
import pandas as pd
import pymysql
from sqlalchemy import create_engine

# MySQL 연결 설정
host = '127.0.0.1'  # 여기에 MySQL 서버의 호스트 주소 또는 IP 주소를 입력하세요
port = 3307
user = 'root'   
password = '1234'
database = 'dataeda'
table_name='ecommerce_customer_data_large'

# MySQL 연결
conn = pymysql.connect(host=host, port=port, user=user, password=password, database=database)
df = pd.read_csv(f"C:\\Users\\fxpow\OneDrive\\바탕 화면\\프로그래머스 데이터 분석가\\프로젝트\\Ecommerce\\데이터 수집\\{table_name}.csv")
## csv read시 colum에 빈칸이 있으면 mysql에서 query 정상작동이 안됨;;


# 연결이 제대로 되었는지 확인
if conn:
    print("MySQL에 성공적으로 연결되었습니다.")
    engine = create_engine(f'mysql+pymysql://{user}:{password}@{host}:{port}/{database}')
    df.to_sql(table_name, con=engine, if_exists='replace', index=False) ## 첫번쨰 파라미터가 Table name

    # 연결 종료
    conn.close()
else:
    print("MySQL 연결에 실패하였습니다.")