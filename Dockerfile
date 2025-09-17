# Use the official Ollama image
FROM ollama/ollama:latest

# Set environment variables
ENV OLLAMA_MODELS=/root/.ollama/models
ENV OLLAMA_HOST=http://0.0.0.0:11434
ENV OLLAMA_MAX_QUEUE=512
ENV OLLAMA_NOHISTORY=true       
ENV OLLAMA_NUM_PARALLEL=2         

# Pre-install the model
RUN ollama serve & sleep 5 && ollama pull smollm2:135m && pkill ollama || true

# Expose the default Ollama port
EXPOSE 11434

# Start Ollama server and preload the model
ENTRYPOINT ["sh", "-c", "ollama serve & sleep 10 && ollama run smollm2:135m 'Warmup' & wait -n"]
