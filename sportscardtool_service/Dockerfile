FROM python:3.11-slim

WORKDIR /app

COPY manbuilder.py api_tool_wrapper.sh ./tools/
RUN chmod +x ./tools/api_tool_wrapper.sh


COPY . /app
# Before running manbuilder.py
RUN apt-get update && apt-get install -y help2man

RUN pip install --no-cache-dir -e .
# Optional: generate man pages during build
RUN python3 ./tools/manbuilder.py generate


ENTRYPOINT ["sportscardtool"]
