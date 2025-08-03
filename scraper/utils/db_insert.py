import os
import mysql.connector
from dotenv import load_dotenv
from loguru import logger

load_dotenv()

def insert_cards_to_db(df):
    try:
        conn = mysql.connector.connect(
            host=os.getenv("MYSQL_HOST"),
            port=int(os.getenv("MYSQL_PORT")),
            user=os.getenv("MYSQL_USER"),
            password=os.getenv("MYSQL_PASSWORD"),
            database=os.getenv("MYSQL_DATABASE")
        )
        cursor = conn.cursor()

        for _, row in df.iterrows():
            cursor.execute("""
                INSERT INTO cards (name, year, set_name, card_number)
                VALUES (%s, %s, %s, %s)
            """, (
                row.get("name"),
                row.get("year"),
                row.get("set_name"),
                row.get("card_number")
            ))

        conn.commit()
        cursor.close()
        conn.close()
        logger.success("Inserted cards into MySQL successfully.")
    except Exception as e:
        logger.error(f"MySQL insert failed: {e}")
