# Use official Ollama Docker image
FROM ollama/ollama:latest

# Expose API port
EXPOSE 11434

# Start Ollama server
CMD ["ollama", "serve", "--port", "11434"]
