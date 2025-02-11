from flask import Flask, request, render_template
import json

app = Flask (__name__)

@app.route('/')

def home ():
    return  render_template("index.html")

@app.route("/item", methods = ['POST'])

def post_item():
    data = request.get_json()
    sql = f"INSERT INTO todolist(item, status) VALUES('{data['item']}'),('{data['status']}')" 
    banco(sql)
    return data

@app.route('/item', methods=['GET'])
def get_item():
    sql = f'SELECT * FROM todolist'
    return banco(sql)

@app.route('/item/<int:lineNumber>', methods=['PATCH'])
def patch_item(lineNumber):
    data = request.get_json()
    sql = f"UPDATE todolist SET item = '{data['item']}', status = '{data['status']}' WHERE \"_lineNumber\" = {lineNumber}"
    banco(sql)
    return data

@app.route('/item/<int:lineNumber>',methods=['DELETE'])
def delete_item(lineNumber):
    sql = f'DELETE FROM todolist WHERE \"_lineNumber\" = {lineNumber}'
    banco(sql)
    return ""

def banco (sql):
    resultado = ""
    try:
        """
        conexão com o banco de dados PostgreSQL
        """
        conn = psycopg2.connect(
            host = "dpg-cuhumc8gph6c73b49vr0-a.oregon-postgres.render.com",
            port = "5432",
            dbname = "senaidb_ijdv",
            user = "senaidb_ijdv_user",
            password = "KVsMrEOmYtCVqIQl8OkhjICC8fwNZeIb"
        )

        cursor = conn.cursor() # cursos vai ser a variavel para executar os comandos SQL

        cursor.execute(sql) # executa o comando sql seja insert, select .. etc

        if sql[0:6] == "INSERT":
            resultado = cursor.fetchone()[0]
        elif sql[0:6] == "SELECT":
            resultado = cursor.fetchall() # vai guardar o resultado do select na var resultado
            colunas = [desc[0] for desc in cursor.description]
            resultado = json.dumps([dict(zip(colunas, row)) for row in resultado])
            resultado = json.loads(resultado)

        cursor.close() # finaliz o cursor

        conn.commit() # confirmar o comando SQL

        conn.close() # finaliza a conexão

    except psycopg2.Error as e:
        ("Error na conexão do banco de dados")
    
    return resultado


if __name__ == '__main__':
    app.run(debug = True)