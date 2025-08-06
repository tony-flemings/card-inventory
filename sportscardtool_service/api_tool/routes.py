from flask import Blueprint, render_template, request
from .api_tool import run_query

bp = Blueprint("main", __name__)

@bp.route("/", methods=["GET", "POST"])
def index():
    results = []
    if request.method == "POST":
        query = request.form["query"]
        results = run_query(query)
    return render_template("form.html", results=results)
