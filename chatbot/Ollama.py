import ollama

# Example: Query Ollama LLM (adjust based on your actual method)
model = ollama.load("llama3.1")
response = model.ask("What is the capital of France?")
print(response)

