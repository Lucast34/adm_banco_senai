import requests
import mysql.connector



def banco(sql):
    conexao = mysql.connector.connect(
        host ='localhost',
        database = 'test_pythonIbge',
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

# Como os json já em um array com isso não há  uma necessidade "filtrar"

lista = obj

i = 0

while i < len(lista):
    id = lista[i]['id']
    sigla = lista[i]['sigla']
    nome = lista[i]['nome']

    sql = f"INSERT INTO macroregiao(id_regiao, sigla, nome) VALUES ('{id}', '{sigla}', '{nome}');"

    banco(sql)
    i += 1