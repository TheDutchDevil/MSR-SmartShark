from pymongo import MongoClient

import os
import time

connection = MongoClient(
    host="research.cassee.dev",
    username="admin-shark",
    password=os.environ.get('MONGO_PASS'))


if __name__ == "__main__":
    while True:
        try:
            queries = list(connection.smartshark_2_1.system.profile.find())

            relevant_queries = [query for query in queries if query['user'] == "read-shark@admin"]

            inserted = 0

            latest_query = connection.smartshark_2_1['profiled_queries'].find_one(sort=[("ts", -1)])

            for query in relevant_queries:
                if query["ts"] > latest_query["ts"]:
                    inserted += 1
                    connection.smartshark_2_1['profiled_queries'].insert_one(query)

            print(f"Inserted {inserted} new profiled queries")

            time.sleep(10)
        except Exception as e:
            print(f"{type(e).__name__} at line {e.__traceback__.tb_lineno} of {__file__}: {e}")
            time.sleep(15)