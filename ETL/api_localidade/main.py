import requests
import mysql.connector



def banco(paramentro):
    conexao = mysql.connector.connect(
        host ='localhost',
        database = 'pizzaria',
        user = 'root',
        password = 'senai@123'
    )
    cursor = conexao.cursor()
    cursor.execute(sql)
    conexao.commit()
    cursor.close()
    conexao.close()

url =  'https://servicodados.ibge.gov.br/api/v1/localidades/regioes'
url2 = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados'
url3 = 'https://servicodados.ibge.gov.br/api/v1/localidades/municipios'

response = requests.get(url)
response_2 = requests.get(url2)
response_3= requests.get(url3)

obj = response.json()

lista = obj['id']['sigla']['nome']