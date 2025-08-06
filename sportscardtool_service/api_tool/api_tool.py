from flask import Flask, render_template, request
from dotenv import load_dotenv
import os
from serpapi import GoogleSearch

load_dotenv()
SERPAPI_KEY = os.getenv("SERPAPI_KEY")

app = Flask(__name__)

def search_serpapi(query):
    params = {
        "engine": "google",
        "q": query,
        "api_key": os.getenv("SERPAPI_KEY")
    }
    search = GoogleSearch(params)
    results = search.get_dict().get("organic_results", [])
    return results

if __name__ == "__main__":
    app.run(debug=True)
