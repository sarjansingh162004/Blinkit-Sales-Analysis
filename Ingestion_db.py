import pandas as pd
import os
from sqlalchemy import create_engine
import logging
import time

# Step 1: Create logs folder if not exists
os.makedirs('Logs', exist_ok=True)

# Step 2: Define log file path
log_file = "Logs/ingestion_db.log"

# Step 3: CLOSE ALL ACTIVE HANDLERS before deleting log file
# It is used to reset or clean up all logging handlers
for handler in logging.root.handlers[:]:
    handler.close()
    logging.root.removeHandler(handler)

# Step 4: Delete old log file if it exists
if os.path.exists(log_file):
    os.remove(log_file)

# Step 5: Now safely setup logging
logging.basicConfig(
    filename=log_file,
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s",
    filemode='a'
)

# Step 6: Create SQLAlchemy engine
def create_db_engine():

    """
    Create a SQLAlchemy engine for MySQL connection.
    Returns:
        SQLAlchemy engine object.
    """

    try:
        engine = create_engine('mysql+pymysql://root:poosin123@localhost:3306/blinkitdb')
        with engine.connect() as conn:
            logging.info("Successfully connected to the MySQL database.")
        return engine
    except Exception as e:
        logging.error("Failed to connect to the database.")
        logging.error(str(e))
        raise

# Step 7: Define the ingestion function
def ingestion_to_db(df, table_name, engine):

    """
    Ingests a DataFrame into a MySQL database table.

    Parameters:
    df (DataFrame): The DataFrame to be written to the database.
    table_name (str): The name of the table to create or replace.
    engine (SQLAlchemy Engine): The SQLAlchemy engine object connected to the database.

    Logs:
    - Success message if the table is ingested successfully.
    - Error message if the ingestion fails.
    """

    try:
        df.to_sql(table_name, con=engine, if_exists='replace', index=False)
        logging.info(f"{table_name} table is ingested successfully to database.")
    except Exception as e:
        logging.error(f"{table_name} table is failed to ingest to database.")
        logging.error(str(e))

# Step 8: Ingestion of all CSVs to MySQL database
def ingest_excel_to_mysql(engine):
    """
    Main function to read Excel file and ingest into MySQL.
    Includes error handling and logs execution time.
    """

    start_time = time.time()
    table_name = 'blinkit_data' 

    try:
        # Load excel file
        file_path = os.path.join('Data', 'blinkit_data.xlsx')
        logging.info(f"Reading Excel file from {file_path}")
        df = pd.read_excel(file_path)
        logging.info(f"Loaded Excel file with {len(df)} rows and {len(df.columns)} columns.")

        # Ingest into MySQL
        ingestion_to_db(df, table_name, engine)

    except Exception as e:
         logging.error("Excel ingestion to MySQL failed.")
         logging.error(str(e))

    end_time = time.time()
    total_time = (end_time - start_time) / 60
    logging.info(f"Ingestion process is completed successfully in {total_time:.2f} mins.")

# Step 9: Run if script is executed
if __name__ == '__main__':
    engine = create_db_engine()
    ingest_excel_to_mysql(engine)