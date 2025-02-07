from flask import Flask, request
import psycopg2

app = Flask (__name__)

@app.route('/')

def home ():
    return "Olá, Flask"

@app.route("/item", methods = ['POST'])

def post_item():
    data = request.get_json()
    sql = f"INSERT INTO todolist(item, status) VALUES('{data['item']}'),('{data['status']}')" 
    banco(sql)
    return data

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
            password = ""
        )

        cursor = conn.cursor() # cursos vai ser a variavel para executar os comandos SQL

        cursor.execute(sql) # executa o comando sql seja insert, select .. etc

        cursor.close() # finaliz o cursor

        conn.commit() # confirmar o comando SQL

        conn.close() # finaliza a conexão

    except psycopg2.Error as e:
        ("Error na conexão do banco de dados")


if __name__ == '__main__':
    app.run(debug = True)