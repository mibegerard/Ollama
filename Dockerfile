# Use the official Ollama image
FROM ollama/ollama:latest

# Set environment variables for Ollama
ENV OLLAMA_MODELS=/root/.ollama/models
ENV OLLAMA_HOST=http://0.0.0.0:11434
ENV OLLAMA_MAX_QUEUE=512

# Pre-install the model
# Start server in background to allow pull
RUN ollama serve & sleep 5 && ollama pull smollm2:135m

# Expose the default Ollama port
EXPOSE 11434

# Start Ollama server when the container runs
CMD ["ollama", "serve"]
