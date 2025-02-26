import requests
import mysql.connector

# função para conectar o banco de dados 
def banco(sql):
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


# Endereço de onde vamos acessar
url = 'https://api.anota.ai/clientauth/nm-category/menu-merchant?displaySources=DIGITAL_MENU'
#Token de autorização
headers = {
    'Authorization' : 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZHBhZ2UiOiI2NGY4ZTUwZGRlYTRkNDAwMTI2OTlmMzMiLCJpYXQiOjE3NDA0MzY1ODl9.92AnF7FLscQMxD0YaV01b0ncRylzfH3w4f9hHWarlew'
}
#execucação da requisição
response = requests.get(url, headers=headers)

# Mostrar o retorno
obj = response.json()

lista = obj['data']['menu']['menu'][1]['itens']

# loop para mostrar todos os items

i = 0 

while i < len(lista):
    titulo = lista[i]['title']
    descricacao = lista[i]['description']
    price = lista[i]['price']

    #print(f'{titulo} - {descricacao} - {price}')
    #sql = f"INSERT INTO pizza2(sabor, ingredientes) VALUES('{titulo}', '{descricacao}');"
    sql = f"UPDATE pizza SET preco = {price} WHERE  sabor = '{titulo}'; "
    banco(sql) 
    i +=1

# Instalar o request executar no cmd ou no shell dentro dessa pasta
# pip install request
# pip install mysql-connector-python




