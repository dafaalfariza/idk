FROM python:3.9-slim

# Install dasar & clean tools
RUN apt-get update && apt-get install -y \
    git curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

# Install torch CPU-only + flask + transformers
RUN pip install --no-cache-dir \
    torch==2.1.0+cpu \
    torchvision==0.16.0+cpu \
    torchaudio==2.1.0+cpu \
    -f https://download.pytorch.org/whl/cpu/torch_stable.html && \
    pip install --no-cache-dir flask transformers

EXPOSE 5000
CMD ["python", "app.py"]
