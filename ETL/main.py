import requests

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



# Instalar o request executar no cmd ou no shell dentro dessa pasta
# pip install request